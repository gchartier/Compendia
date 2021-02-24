const db = require("../../../../util/database").instance
import { getUserOrRedirect } from "@util/cookie"

async function getCollectedComics(client, res, userID) {
    const query = `SELECT comic_id, title, item_number, cover
        FROM collected_comics as cc FULL JOIN comics as c USING(comic_id) FULL JOIN collections as col USING(collection_id)
        WHERE col.user_id = $1
        ORDER BY c.release_date DESC
        FETCH FIRST 10 ROWS ONLY`
    const params = [userID]
    const result = await client.query(query, params)

    if (result.rows.length !== 1) res.status(404).json({ message: "No collected comics returned" })
    else return result.rows
}

export default async function handler(req, res) {
    const user = getUserOrRedirect(req, res)
    res.setHeader("Content-Type", "application/json")

    const client = await db.connect()
    try {
        if (req.method === "GET") {
            const collectedComics = await getCollectedComics(client, res, user.id)

            res.status(200).json({
                collectedComics: collectedComics.map((comic) => {
                    return {
                        id: comic.comic_id,
                        title: comic.title,
                        itemNumber: comic.item_number,
                        cover: comic.cover,
                    }
                }),
            })
        }
    } catch (error) {
        console.log(error)
        res.status(500).json({ message: error.message })
    } finally {
        await client.end()
        await client.release()
    }
}