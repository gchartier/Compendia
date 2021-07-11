import axios from "axios"
import { useQuery } from "react-query"

export function useParsedReleases() {
    return useQuery(
        `parsed-releases`,
        async () => {
            const { data } = await axios.get(`/api/admin/parser`)
            return data
        },
        { staleTime: 600000 }
    )
}
