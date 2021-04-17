import PropTypes from "prop-types"

export function SearchResult({ key, type, children }) {
    return (
        <li key={key} className="flex flex-col items-start mb-6">
            <div className="">{children}</div>
            <div className="text-sm pl-1">{type}</div>
        </li>
    )
}
SearchResult.propTypes = {
    key: PropTypes.string.isRequired,
    type: PropTypes.string.isRequired,
    children: PropTypes.element.isRequired,
}