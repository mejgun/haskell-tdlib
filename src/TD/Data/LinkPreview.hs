module TD.Data.LinkPreview
  (LinkPreview(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.LinkPreviewType as LinkPreviewType

data LinkPreview
  = LinkPreview -- ^ Describes a link preview
    { url                          :: Maybe T.Text                          -- ^ Original URL of the link
    , display_url                  :: Maybe T.Text                          -- ^ URL to display
    , site_name                    :: Maybe T.Text                          -- ^ Short name of the site (e.g., Google Docs, App Store)
    , title                        :: Maybe T.Text                          -- ^ Title of the content
    , description                  :: Maybe FormattedText.FormattedText     -- ^ Description of the content
    , author                       :: Maybe T.Text                          -- ^ Author of the content
    , _type                        :: Maybe LinkPreviewType.LinkPreviewType -- ^ Type of the link preview
    , has_large_media              :: Maybe Bool                            -- ^ True, if size of media in the preview can be changed
    , show_large_media             :: Maybe Bool                            -- ^ True, if large media preview must be shown; otherwise, the media preview must be shown small and only the first frame must be shown for videos
    , show_media_above_description :: Maybe Bool                            -- ^ True, if media must be shown above link preview description; otherwise, the media must be shown below the description
    , skip_confirmation            :: Maybe Bool                            -- ^ True, if there is no need to show an ordinary open URL confirmation, when opening the URL from the preview, because the URL is shown in the message text in clear
    , show_above_text              :: Maybe Bool                            -- ^ True, if the link preview must be shown above message text; otherwise, the link preview must be shown below the message text
    , instant_view_version         :: Maybe Int                             -- ^ Version of instant view (currently, can be 1 or 2) for the web page; 0 if none
    }
  deriving (Eq, Show)

instance I.ShortShow LinkPreview where
  shortShow LinkPreview
    { url                          = url_
    , display_url                  = display_url_
    , site_name                    = site_name_
    , title                        = title_
    , description                  = description_
    , author                       = author_
    , _type                        = _type_
    , has_large_media              = has_large_media_
    , show_large_media             = show_large_media_
    , show_media_above_description = show_media_above_description_
    , skip_confirmation            = skip_confirmation_
    , show_above_text              = show_above_text_
    , instant_view_version         = instant_view_version_
    }
      = "LinkPreview"
        ++ I.cc
        [ "url"                          `I.p` url_
        , "display_url"                  `I.p` display_url_
        , "site_name"                    `I.p` site_name_
        , "title"                        `I.p` title_
        , "description"                  `I.p` description_
        , "author"                       `I.p` author_
        , "_type"                        `I.p` _type_
        , "has_large_media"              `I.p` has_large_media_
        , "show_large_media"             `I.p` show_large_media_
        , "show_media_above_description" `I.p` show_media_above_description_
        , "skip_confirmation"            `I.p` skip_confirmation_
        , "show_above_text"              `I.p` show_above_text_
        , "instant_view_version"         `I.p` instant_view_version_
        ]

instance AT.FromJSON LinkPreview where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "linkPreview" -> parseLinkPreview v
      _             -> mempty
    
    where
      parseLinkPreview :: A.Value -> AT.Parser LinkPreview
      parseLinkPreview = A.withObject "LinkPreview" $ \o -> do
        url_                          <- o A..:?  "url"
        display_url_                  <- o A..:?  "display_url"
        site_name_                    <- o A..:?  "site_name"
        title_                        <- o A..:?  "title"
        description_                  <- o A..:?  "description"
        author_                       <- o A..:?  "author"
        _type_                        <- o A..:?  "type"
        has_large_media_              <- o A..:?  "has_large_media"
        show_large_media_             <- o A..:?  "show_large_media"
        show_media_above_description_ <- o A..:?  "show_media_above_description"
        skip_confirmation_            <- o A..:?  "skip_confirmation"
        show_above_text_              <- o A..:?  "show_above_text"
        instant_view_version_         <- o A..:?  "instant_view_version"
        pure $ LinkPreview
          { url                          = url_
          , display_url                  = display_url_
          , site_name                    = site_name_
          , title                        = title_
          , description                  = description_
          , author                       = author_
          , _type                        = _type_
          , has_large_media              = has_large_media_
          , show_large_media             = show_large_media_
          , show_media_above_description = show_media_above_description_
          , skip_confirmation            = skip_confirmation_
          , show_above_text              = show_above_text_
          , instant_view_version         = instant_view_version_
          }
  parseJSON _ = mempty

