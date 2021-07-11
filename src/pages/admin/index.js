import { Button } from "@components/common/buttons/Button"
import { Page } from "@components/common/Page"
import { ComicCover } from "@components/pages/comic/ComicCover"
import { useUser } from "@hooks/magic"
import { useParsedReleases } from "@hooks/queries/scraper"
import Link from "next/link"

export default function Admin() {
    const user = useUser({ redirectTo: "/auth/login" })
    const { isLoading, isError, error, data: comics } = useParsedReleases()

    return (
        <Page title="Admin">
            {!isLoading && !isError ? (
                <ul>
                    {comics.map((comic) => (
                        <li key={comic.id}>
                            <ComicCover
                                comicID={comic.id}
                                title={comic.title}
                                cover={comic.coverLink}
                                link={comic.link}
                            />
                        </li>
                    ))}
                </ul>
            ) : (
                <></>
            )}
        </Page>
    )
}
