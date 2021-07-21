import PropTypes from "prop-types"
import { Page } from "@components/common/Page"
import { useUser } from "@hooks/magic"
import { useParsedReleases } from "@hooks/queries/scraper"
import { useState } from "react"
import Image from "next/image"
import { CloseIcon } from "@components/icons/Close"

function Cover({ comic, onClick }) {
    return (
        <div className="relative w-52 h-80 sm:w-64 sm:h-96" onClick={onClick}>
            <Image
                src={comic.coverLink}
                alt={`Cover art for ${comic.title} ${comic.itemNumber ? comic.itemNumber : ""}`}
                layout="fill"
                objectFit="cover"
                className="rounded cursor-pointer"
            />
        </div>
    )
}
Cover.propTypes = {
    comic: PropTypes.object.isRequired,
    onClick: PropTypes.func.isRequired,
}

const Field = ({ value, fieldType, label, disabled = false, clearable = false }) => {
    const [fieldValue, setFieldValue] = useState(value ? value + "" : "")
    return (
        <label className="flex flex-col items-start sm:pr-10 pb-5">
            <span className="font-bold pb-2">{label}</span>
            {disabled ? (
                <div
                    className={`text-left sm:text-center ${
                        !fieldValue ? "font-bold text-2xl" : ""
                    }`}
                >
                    {fieldValue ? fieldValue : "-"}
                </div>
            ) : (
                <div className="flex items-center">
                    <input
                        disabled={disabled}
                        className="rounded-xl border-2 w-auto"
                        type={fieldType}
                        value={fieldValue ?? ""}
                        size={fieldValue ? fieldValue.length + 1 : 10}
                        onChange={(e) => {
                            setFieldValue(e.target.value)
                        }}
                    />
                    {clearable ? (
                        <CloseIcon onClick={() => setFieldValue("")} className="pl-2" />
                    ) : (
                        <></>
                    )}
                </div>
            )}
        </label>
    )
}
Field.propTypes = {
    value: PropTypes.oneOfType([PropTypes.string, PropTypes.number]),
    fieldType: PropTypes.string.isRequired,
    label: PropTypes.string.isRequired,
    disabled: PropTypes.bool,
    clearable: PropTypes.bool,
}

const Dropdown = ({ options, label, value }) => {
    const [fieldValue, setFieldValue] = useState(value)
    return (
        <label className="flex flex-col sm:pr-10 pb-5">
            <span className="font-bold pb-2">{label}</span>
            <select
                className="rounded-xl border-2"
                value={fieldValue}
                onChange={(e) => {
                    setFieldValue(e.target.value)
                }}
            >
                {options.map((option) => (
                    <option value={option}>{option}</option>
                ))}
            </select>
        </label>
    )
}
Dropdown.propTypes = {
    options: PropTypes.array.isRequired,
    label: PropTypes.string.isRequired,
    value: PropTypes.string.isRequired,
}

const Checkbox = ({ label, value }) => {
    const [fieldValue, setFieldValue] = useState(value)
    return (
        <label className="flex flex-col sm:pr-10 py-5">
            <span className="font-bold pb-2">{label}</span>
            <input
                type="checkbox"
                onChange={(e) => setFieldValue(e.target.value)}
                className="form-checkbox h-5 w-5 text-blue-primary-200"
                checked={fieldValue}
            />
        </label>
    )
}
Checkbox.propTypes = {
    label: PropTypes.string.isRequired,
    value: PropTypes.string.isRequired,
}

export default function Admin() {
    const user = useUser({ redirectTo: "/auth/login" })
    const { isLoading, isError, error, data: comics } = useParsedReleases()

    return (
        <Page title="Admin">
            {!isLoading && !isError ? (
                <ul>
                    {comics.map((comic) => (
                        <li key={comic.id} className="flex flex-row pb-8">
                            <Cover
                                comic={comic}
                                onClick={() => window.open(comic.releaseLink, "_newtab")}
                            />
                            <div className="flex flex-col pl-6">
                                <Field
                                    value={comic.unparsedTitle}
                                    fieldType="text"
                                    label="Unparsed Title"
                                    disabled={true}
                                />
                                <div className="flex flex-row">
                                    <Field
                                        value={comic.seriesName}
                                        fieldType="text"
                                        label="Series"
                                    />
                                    <Field
                                        value={comic.publisherName}
                                        fieldType="text"
                                        label="Publisher"
                                    />
                                    <Dropdown
                                        value={comic.format}
                                        label="Format"
                                        options={[
                                            "",
                                            "Single Issue",
                                            "Omnibus",
                                            "Trade Paperback",
                                            "Issue Pack",
                                            "Omnibus Hardcover",
                                            "Graphic Novel",
                                            "Hardcover",
                                            "Graphic Novel Hardcover",
                                        ]}
                                    />
                                    <Dropdown
                                        value={comic.ageRating}
                                        label="Age Rating"
                                        options={["", "E", "T", "T+", "MA"]}
                                    />
                                </div>

                                <div className="flex flex-row">
                                    <Field value={comic.title} fieldType="text" label="Title" />
                                    <Field
                                        value={comic.itemNumber}
                                        fieldType="text"
                                        label="Item Number"
                                    />
                                    <Field
                                        value={comic.subtitle}
                                        fieldType="text"
                                        label="Subtitle"
                                        clearable={true}
                                    />
                                    <Field
                                        value={comic.coverLetter}
                                        fieldType="text"
                                        label="Cover Letter"
                                    />
                                    <Field
                                        value={comic.printingNumber}
                                        fieldType="text"
                                        label="Printing"
                                    />
                                </div>

                                <div className="flex flex-row">
                                    <Field
                                        value={comic.variantDescription}
                                        fieldType="text"
                                        label="Variant Description"
                                        clearable={true}
                                    />
                                    <Field
                                        value={comic.titleOverflow}
                                        fieldType="text"
                                        label="Title Overflow"
                                        clearable={true}
                                    />
                                    <Field
                                        value={comic.variantTypes}
                                        fieldType="text"
                                        label="Variant Types"
                                    />
                                    <Checkbox label="One Shot" value={comic.isOneShot} />
                                    <Checkbox label="Mini Series" value={comic.isMiniSeries} />
                                </div>
                                <div></div>
                            </div>
                        </li>
                    ))}
                </ul>
            ) : (
                <></>
            )}
        </Page>
    )
}
