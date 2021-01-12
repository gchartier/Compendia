import axios from "axios"
import { useRouter } from "next/router"
import { useState } from "react"
import { useQuery } from "react-query"
import Link from "next/link"
import Page from "../../components/Page"
import FullScreenModal from "../../components/utils/FullScreenModal"
import CollectionDetails from "../../components/comic/CollectionDetails"
import CollectionButton from "../../components/comic/CollectionButton"
import Arrow from "../../components/utils/Arrow"
import Lists from "../../components/comic/Lists"
import { formatDateStringForView } from "../../util/date"

function useComicDetail(id) {
    return useQuery(["comic-detail", id], async () => {
        const { data } = await axios.get(`/api/comics/${id}`)
        return data
    })
}

function ComicDetail({ itemName, item }) {
    return (
        <div className="px-6 py-2 flex flex-col items-center">
            <p className="text-gray-900 font-extrabold text-lg">{itemName}</p>
            <p>{item ? item : "-"}</p>
        </div>
    )
}

export default function Comic() {
    const router = useRouter()
    const { id } = router.query
    const { status, error, data: comic } = useComicDetail(parseInt(id))
    const [showFullCover, setShowFullCover] = useState(false)

    // Prevent further processing when the id query param doesn't exist
    if (!id) return <></>

    return (
        <>
            {status === "loading" ? (
                <div>Loading...</div>
            ) : status === "error" ? (
                <div>Error: {error.message}</div>
            ) : (
                <Page title={`${comic.seriesName} ${comic.title} - ${comic.publisherName}`}>
                    <div className="flex flex-wrap justify-center mb-10">
                        <img
                            src={comic.cover}
                            alt={`Cover art for ${comic.title}`}
                            className="rounded h-72 lg:h-96 cursor-pointer"
                            onClick={() => setShowFullCover(!showFullCover)}
                        />
                        <article className="mt-8 sm:ml-6 sm:mt-6">
                            <h2 className="font-bold text-3xl text-center md:text-left">{`${comic.seriesName} ${comic.title}`}</h2>
                            <div className="flex flex-col items-center pt-1 md:items-start">
                                <p className="italic text-xl mr-2 mb-1">
                                    {`${comic.publisherName} ${
                                        comic.imprintID ? " - " + comic.imprintName : ""
                                    }`}
                                </p>

                                {comic.versions > 0 && (
                                    <Link href={`/comics/${comic.id}/versions`} passHref>
                                        <a className="flex items-center w-min whitespace-nowrap text-gray-800 font-bold text-md">
                                            <span>{`${comic.versions} Other Version${
                                                comic.versions > 1 ? "s" : ""
                                            }`}</span>
                                            <Arrow
                                                colorClass="text-blue-primary-200"
                                                className="pl-1"
                                                pixelHeight="16px"
                                            />
                                        </a>
                                    </Link>
                                )}

                                <CollectionButton comic={comic} />
                            </div>

                            <div className="flex flex-wrap justify-center py-5 sm:pt-2 ">
                                <ComicDetail itemName="Price" item={comic.coverPrice} />
                                <ComicDetail
                                    itemName="Released"
                                    item={formatDateStringForView(comic.releaseDate)}
                                />
                                <ComicDetail itemName="Format" item={comic.format} />
                                <ComicDetail itemName="Rating" item={comic.ageRating} />
                            </div>
                            {comic.description ? (
                                <p className="m-4 sm:m-0 max-w-md">{comic.description}</p>
                            ) : (
                                <p className="text-gray-600 text-xl m-4">No Description...</p>
                            )}
                        </article>
                    </div>
                    <hr />
                    <div className="flex mt-10">
                        <Lists comicID={comic.id} />
                        <CollectionDetails comicID={comic.id} isCollected={comic.isCollected} />
                    </div>

                    {showFullCover && (
                        <FullScreenModal
                            onClick={() => {
                                setShowFullCover(!showFullCover)
                            }}
                        >
                            <img
                                src={comic.cover}
                                alt={`Cover art for ${comic.title}`}
                                className="rounded h-4/6 sm:h-screen"
                            />
                        </FullScreenModal>
                    )}
                </Page>
            )}
        </>
    )
}
