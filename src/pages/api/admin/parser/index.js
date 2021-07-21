import { db } from "@util/database"

async function getParsedComics(client) {
    const query = `SELECT parsed_comic_id, release_link, diamond_id, cover_price, cover_link, item_number,
    description, publisher_name, release_date, solicitation_date, title, printing_number, cover_letter,
    variant_types, age_rating, is_mini_series, mini_series_limit, is_one_shot, format, series_link,
    series_name, title_overflow, variant_description, unparsed_creators, unparsed_title, unparsed_subtitle, unparsed_format,
    unparsed_item_number, unparsed_variant_description, unparsed_cover_description, unparsed_cover_letter_description,
    unparsed_additional_descriptions FROM parsed_comics`
    const params = []
    const result = await client.query(query, params)

    return result.rows
}

export default async function handler(req, res) {
    res.setHeader("Content-Type", "application/json")

    const client = await db.connect()
    try {
        const parsedComics = await getParsedComics(client)

        res.status(200).json(
            parsedComics.map((comic) => {
                return {
                    id: comic.parsed_comic_id,
                    releaseLink: comic.release_link,
                    diamondID: comic.diamond_id,
                    coverPrice: comic.cover_price,
                    coverLink: comic.cover_link,
                    itemNumber: comic.item_number,
                    description: comic.description,
                    publisherName: comic.publisher_name,
                    releaseDate: comic.release_date,
                    solicitationDate: comic.solicitation_date,
                    title: comic.title,
                    printingNumber: comic.printing_number,
                    coverLetter: comic.cover_letter,
                    variantTypes: comic.variant_types,
                    ageRating: comic.age_rating,
                    isMiniSeries: comic.is_mini_series,
                    miniSeriesLimit: comic.mini_series_limit,
                    isOneShot: comic.is_one_shot,
                    format: comic.format,
                    seriesLink: comic.series_link,
                    seriesName: comic.series_name,
                    titleOverflow: comic.title_overflow,
                    variantDescription: comic.variant_description,
                    unparsedCreators: comic.unparsed_creators,
                    unparsedTitle: comic.unparsed_title,
                    unparsedSubtitle: comic.unparsed_subtitle,
                    unparsedFormat: comic.unparsed_format,
                    unparsedItemNumber: comic.unparsed_item_number,
                    unparsedVariantDescription: comic.unparsed_variant_description,
                    unparsedCoverDescription: comic.unparsed_cover_description,
                    unparsedCoverLetterDescription: comic.unparsed_cover_letter_description,
                    unparsedAdditionalDescriptions: comic.unparsed_additional_descriptions,
                }
            })
        )
    } catch (error) {
        console.log(error)
        res.status(500).json({ message: error.message })
    } finally {
        await client.end()
        await client.release()
    }
}
