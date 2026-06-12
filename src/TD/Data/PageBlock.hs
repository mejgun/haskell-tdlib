module TD.Data.PageBlock
  (PageBlock(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.RichText as RichText
import qualified Data.Text as T
import {-# SOURCE #-} qualified TD.Data.PageBlockListItem as PageBlockListItem
import qualified TD.Data.Animation as Animation
import qualified TD.Data.PageBlockCaption as PageBlockCaption
import qualified TD.Data.Audio as Audio
import qualified TD.Data.Photo as Photo
import qualified TD.Data.Video as Video
import qualified TD.Data.VoiceNote as VoiceNote
import qualified TD.Data.ChatPhotoInfo as ChatPhotoInfo
import qualified TD.Data.PageBlockTableCell as PageBlockTableCell
import qualified TD.Data.PageBlockRelatedArticle as PageBlockRelatedArticle
import qualified TD.Data.Location as Location

-- | Describes a block of an instant view for a web page
data PageBlock
  = PageBlockTitle -- ^ The title of a page; instant view only
    { title :: Maybe RichText.RichText -- ^ Title
    }
  | PageBlockSubtitle -- ^ The subtitle of a page; instant view only
    { subtitle :: Maybe RichText.RichText -- ^ Subtitle
    }
  | PageBlockAuthorDate -- ^ The author and publishing date of a page; instant view only
    { author       :: Maybe RichText.RichText -- ^ Author
    , publish_date :: Maybe Int               -- ^ Point in time (Unix timestamp) when the article was published; 0 if unknown
    }
  | PageBlockHeader -- ^ A header; instant view only
    { header :: Maybe RichText.RichText -- ^ Header
    }
  | PageBlockSubheader -- ^ A subheader; instant view only
    { subheader :: Maybe RichText.RichText -- ^ Subheader
    }
  | PageBlockSectionHeading -- ^ A section heading
    { text :: Maybe RichText.RichText -- ^ Text of the section heading
    , size :: Maybe Int               -- ^ Relative size of the text font; 1-6, 1 is the largest, 6 is the smallest
    }
  | PageBlockKicker -- ^ A kicker; instant view only
    { kicker :: Maybe RichText.RichText -- ^ Kicker
    }
  | PageBlockParagraph -- ^ A text paragraph
    { text :: Maybe RichText.RichText -- ^ Paragraph text
    }
  | PageBlockPreformatted -- ^ A preformatted text paragraph
    { text     :: Maybe RichText.RichText -- ^ Paragraph text
    , language :: Maybe T.Text            -- ^ Programming language for which the text needs to be formatted
    }
  | PageBlockFooter -- ^ The footer of a page
    { footer :: Maybe RichText.RichText -- ^ Footer
    }
  | PageBlockThinking -- ^ A "Thinking..." placeholder; for pending rich messages only
    { text :: Maybe RichText.RichText -- ^ Text of the placeholder
    }
  | PageBlockDivider -- ^ An empty block separating a page
  | PageBlockMathematicalExpression -- ^ A mathematical expression
    { expression :: Maybe T.Text -- ^ The expression in LaTeX format
    }
  | PageBlockAnchor -- ^ An invisible anchor on a page, which can be used in a URL to open the page from the specified anchor
    { name :: Maybe T.Text -- ^ Name of the anchor
    }
  | PageBlockList -- ^ A list of data blocks
    { items :: Maybe [PageBlockListItem.PageBlockListItem] -- ^ The items of the list
    }
  | PageBlockBlockQuote -- ^ A block quote
    { blocks :: Maybe [PageBlock]       -- ^ Quote blocks
    , credit :: Maybe RichText.RichText -- ^ Quote credit; may be null if none
    }
  | PageBlockPullQuote -- ^ A pull quote
    { text   :: Maybe RichText.RichText -- ^ Quote text
    , credit :: Maybe RichText.RichText -- ^ Quote credit; may be null if none
    }
  | PageBlockAnimation -- ^ An animation
    { animation     :: Maybe Animation.Animation               -- ^ Animation file; may be null
    , caption       :: Maybe PageBlockCaption.PageBlockCaption -- ^ Animation caption; may be null if none
    , need_autoplay :: Maybe Bool                              -- ^ True, if the animation must be played automatically
    , has_spoiler   :: Maybe Bool                              -- ^ True, if the animation preview must be covered by a spoiler animation
    }
  | PageBlockAudio -- ^ An audio file
    { audio   :: Maybe Audio.Audio                       -- ^ Audio file; may be null
    , caption :: Maybe PageBlockCaption.PageBlockCaption -- ^ Audio file caption; may be null if none
    }
  | PageBlockPhoto -- ^ A photo
    { photo       :: Maybe Photo.Photo                       -- ^ Photo file; may be null
    , caption     :: Maybe PageBlockCaption.PageBlockCaption -- ^ Photo caption; may be null if none
    , url         :: Maybe T.Text                            -- ^ URL that needs to be opened when the photo is clicked; instant view only
    , has_spoiler :: Maybe Bool                              -- ^ True, if the photo preview must be covered by a spoiler animation
    }
  | PageBlockVideo -- ^ A video
    { video         :: Maybe Video.Video                       -- ^ Video file; may be null
    , caption       :: Maybe PageBlockCaption.PageBlockCaption -- ^ Video caption; may be null if none
    , need_autoplay :: Maybe Bool                              -- ^ True, if the video must be played automatically
    , is_looped     :: Maybe Bool                              -- ^ True, if the video must be looped
    , has_spoiler   :: Maybe Bool                              -- ^ True, if the video preview must be covered by a spoiler animation
    }
  | PageBlockVoiceNote -- ^ A voice note
    { voice_note :: Maybe VoiceNote.VoiceNote               -- ^ Voice note; may be null
    , caption    :: Maybe PageBlockCaption.PageBlockCaption -- ^ Voice note caption; may be null if none
    }
  | PageBlockCover -- ^ A page cover; instant view only
    { cover :: Maybe PageBlock -- ^ Cover
    }
  | PageBlockEmbedded -- ^ An embedded web page; instant view only
    { url             :: Maybe T.Text                            -- ^ URL of the embedded page, if available
    , html            :: Maybe T.Text                            -- ^ HTML-markup of the embedded page
    , poster_photo    :: Maybe Photo.Photo                       -- ^ Poster photo, if available; may be null
    , width           :: Maybe Int                               -- ^ Block width; 0 if unknown
    , height          :: Maybe Int                               -- ^ Block height; 0 if unknown
    , caption         :: Maybe PageBlockCaption.PageBlockCaption -- ^ Block caption; may be null if none
    , is_full_width   :: Maybe Bool                              -- ^ True, if the block must be full width
    , allow_scrolling :: Maybe Bool                              -- ^ True, if scrolling needs to be allowed
    }
  | PageBlockEmbeddedPost -- ^ An embedded post; instant view only
    { url          :: Maybe T.Text                            -- ^ URL of the embedded post
    , _author      :: Maybe T.Text                            -- ^ Post author
    , author_photo :: Maybe Photo.Photo                       -- ^ Post author photo; may be null
    , date         :: Maybe Int                               -- ^ Point in time (Unix timestamp) when the post was created; 0 if unknown
    , blocks       :: Maybe [PageBlock]                       -- ^ Post content
    , caption      :: Maybe PageBlockCaption.PageBlockCaption -- ^ Post caption; may be null if none
    }
  | PageBlockCollage -- ^ A collage
    { blocks  :: Maybe [PageBlock]                       -- ^ Collage item contents
    , caption :: Maybe PageBlockCaption.PageBlockCaption -- ^ Block caption; may be null if none
    }
  | PageBlockSlideshow -- ^ A slideshow
    { blocks  :: Maybe [PageBlock]                       -- ^ Slideshow item contents
    , caption :: Maybe PageBlockCaption.PageBlockCaption -- ^ Block caption; may be null if none
    }
  | PageBlockChatLink -- ^ A link to a chat; instant view only
    { _title          :: Maybe T.Text                      -- ^ Chat title
    , _photo          :: Maybe ChatPhotoInfo.ChatPhotoInfo -- ^ Chat photo; may be null
    , accent_color_id :: Maybe Int                         -- ^ Identifier of the accent color for chat title and background of chat photo
    , username        :: Maybe T.Text                      -- ^ Chat username by which all other information about the chat can be resolved
    }
  | PageBlockTable -- ^ A table
    { _caption    :: Maybe RichText.RichText                         -- ^ Table caption; may be null if none
    , cells       :: Maybe [[PageBlockTableCell.PageBlockTableCell]] -- ^ Table cells
    , is_bordered :: Maybe Bool                                      -- ^ True, if the table is bordered
    , is_striped  :: Maybe Bool                                      -- ^ True, if the table is striped
    }
  | PageBlockDetails -- ^ A collapsible block
    { header  :: Maybe RichText.RichText -- ^ Always visible heading for the block
    , blocks  :: Maybe [PageBlock]       -- ^ Block contents
    , is_open :: Maybe Bool              -- ^ True, if the block is open by default
    }
  | PageBlockRelatedArticles -- ^ Related articles; instant view only
    { header   :: Maybe RichText.RichText                                 -- ^ Block header
    , articles :: Maybe [PageBlockRelatedArticle.PageBlockRelatedArticle] -- ^ List of related articles
    }
  | PageBlockMap -- ^ A map
    { location :: Maybe Location.Location                 -- ^ Location of the map center
    , zoom     :: Maybe Int                               -- ^ Map zoom level
    , width    :: Maybe Int                               -- ^ Map width
    , height   :: Maybe Int                               -- ^ Map height
    , caption  :: Maybe PageBlockCaption.PageBlockCaption -- ^ Block caption; may be null if none
    }
  deriving (Eq, Show)

instance I.ShortShow PageBlock where
  shortShow PageBlockTitle
    { title = title_
    }
      = "PageBlockTitle"
        ++ I.cc
        [ "title" `I.p` title_
        ]
  shortShow PageBlockSubtitle
    { subtitle = subtitle_
    }
      = "PageBlockSubtitle"
        ++ I.cc
        [ "subtitle" `I.p` subtitle_
        ]
  shortShow PageBlockAuthorDate
    { author       = author_
    , publish_date = publish_date_
    }
      = "PageBlockAuthorDate"
        ++ I.cc
        [ "author"       `I.p` author_
        , "publish_date" `I.p` publish_date_
        ]
  shortShow PageBlockHeader
    { header = header_
    }
      = "PageBlockHeader"
        ++ I.cc
        [ "header" `I.p` header_
        ]
  shortShow PageBlockSubheader
    { subheader = subheader_
    }
      = "PageBlockSubheader"
        ++ I.cc
        [ "subheader" `I.p` subheader_
        ]
  shortShow PageBlockSectionHeading
    { text = text_
    , size = size_
    }
      = "PageBlockSectionHeading"
        ++ I.cc
        [ "text" `I.p` text_
        , "size" `I.p` size_
        ]
  shortShow PageBlockKicker
    { kicker = kicker_
    }
      = "PageBlockKicker"
        ++ I.cc
        [ "kicker" `I.p` kicker_
        ]
  shortShow PageBlockParagraph
    { text = text_
    }
      = "PageBlockParagraph"
        ++ I.cc
        [ "text" `I.p` text_
        ]
  shortShow PageBlockPreformatted
    { text     = text_
    , language = language_
    }
      = "PageBlockPreformatted"
        ++ I.cc
        [ "text"     `I.p` text_
        , "language" `I.p` language_
        ]
  shortShow PageBlockFooter
    { footer = footer_
    }
      = "PageBlockFooter"
        ++ I.cc
        [ "footer" `I.p` footer_
        ]
  shortShow PageBlockThinking
    { text = text_
    }
      = "PageBlockThinking"
        ++ I.cc
        [ "text" `I.p` text_
        ]
  shortShow PageBlockDivider
      = "PageBlockDivider"
  shortShow PageBlockMathematicalExpression
    { expression = expression_
    }
      = "PageBlockMathematicalExpression"
        ++ I.cc
        [ "expression" `I.p` expression_
        ]
  shortShow PageBlockAnchor
    { name = name_
    }
      = "PageBlockAnchor"
        ++ I.cc
        [ "name" `I.p` name_
        ]
  shortShow PageBlockList
    { items = items_
    }
      = "PageBlockList"
        ++ I.cc
        [ "items" `I.p` items_
        ]
  shortShow PageBlockBlockQuote
    { blocks = blocks_
    , credit = credit_
    }
      = "PageBlockBlockQuote"
        ++ I.cc
        [ "blocks" `I.p` blocks_
        , "credit" `I.p` credit_
        ]
  shortShow PageBlockPullQuote
    { text   = text_
    , credit = credit_
    }
      = "PageBlockPullQuote"
        ++ I.cc
        [ "text"   `I.p` text_
        , "credit" `I.p` credit_
        ]
  shortShow PageBlockAnimation
    { animation     = animation_
    , caption       = caption_
    , need_autoplay = need_autoplay_
    , has_spoiler   = has_spoiler_
    }
      = "PageBlockAnimation"
        ++ I.cc
        [ "animation"     `I.p` animation_
        , "caption"       `I.p` caption_
        , "need_autoplay" `I.p` need_autoplay_
        , "has_spoiler"   `I.p` has_spoiler_
        ]
  shortShow PageBlockAudio
    { audio   = audio_
    , caption = caption_
    }
      = "PageBlockAudio"
        ++ I.cc
        [ "audio"   `I.p` audio_
        , "caption" `I.p` caption_
        ]
  shortShow PageBlockPhoto
    { photo       = photo_
    , caption     = caption_
    , url         = url_
    , has_spoiler = has_spoiler_
    }
      = "PageBlockPhoto"
        ++ I.cc
        [ "photo"       `I.p` photo_
        , "caption"     `I.p` caption_
        , "url"         `I.p` url_
        , "has_spoiler" `I.p` has_spoiler_
        ]
  shortShow PageBlockVideo
    { video         = video_
    , caption       = caption_
    , need_autoplay = need_autoplay_
    , is_looped     = is_looped_
    , has_spoiler   = has_spoiler_
    }
      = "PageBlockVideo"
        ++ I.cc
        [ "video"         `I.p` video_
        , "caption"       `I.p` caption_
        , "need_autoplay" `I.p` need_autoplay_
        , "is_looped"     `I.p` is_looped_
        , "has_spoiler"   `I.p` has_spoiler_
        ]
  shortShow PageBlockVoiceNote
    { voice_note = voice_note_
    , caption    = caption_
    }
      = "PageBlockVoiceNote"
        ++ I.cc
        [ "voice_note" `I.p` voice_note_
        , "caption"    `I.p` caption_
        ]
  shortShow PageBlockCover
    { cover = cover_
    }
      = "PageBlockCover"
        ++ I.cc
        [ "cover" `I.p` cover_
        ]
  shortShow PageBlockEmbedded
    { url             = url_
    , html            = html_
    , poster_photo    = poster_photo_
    , width           = width_
    , height          = height_
    , caption         = caption_
    , is_full_width   = is_full_width_
    , allow_scrolling = allow_scrolling_
    }
      = "PageBlockEmbedded"
        ++ I.cc
        [ "url"             `I.p` url_
        , "html"            `I.p` html_
        , "poster_photo"    `I.p` poster_photo_
        , "width"           `I.p` width_
        , "height"          `I.p` height_
        , "caption"         `I.p` caption_
        , "is_full_width"   `I.p` is_full_width_
        , "allow_scrolling" `I.p` allow_scrolling_
        ]
  shortShow PageBlockEmbeddedPost
    { url          = url_
    , _author      = _author_
    , author_photo = author_photo_
    , date         = date_
    , blocks       = blocks_
    , caption      = caption_
    }
      = "PageBlockEmbeddedPost"
        ++ I.cc
        [ "url"          `I.p` url_
        , "_author"      `I.p` _author_
        , "author_photo" `I.p` author_photo_
        , "date"         `I.p` date_
        , "blocks"       `I.p` blocks_
        , "caption"      `I.p` caption_
        ]
  shortShow PageBlockCollage
    { blocks  = blocks_
    , caption = caption_
    }
      = "PageBlockCollage"
        ++ I.cc
        [ "blocks"  `I.p` blocks_
        , "caption" `I.p` caption_
        ]
  shortShow PageBlockSlideshow
    { blocks  = blocks_
    , caption = caption_
    }
      = "PageBlockSlideshow"
        ++ I.cc
        [ "blocks"  `I.p` blocks_
        , "caption" `I.p` caption_
        ]
  shortShow PageBlockChatLink
    { _title          = _title_
    , _photo          = _photo_
    , accent_color_id = accent_color_id_
    , username        = username_
    }
      = "PageBlockChatLink"
        ++ I.cc
        [ "_title"          `I.p` _title_
        , "_photo"          `I.p` _photo_
        , "accent_color_id" `I.p` accent_color_id_
        , "username"        `I.p` username_
        ]
  shortShow PageBlockTable
    { _caption    = _caption_
    , cells       = cells_
    , is_bordered = is_bordered_
    , is_striped  = is_striped_
    }
      = "PageBlockTable"
        ++ I.cc
        [ "_caption"    `I.p` _caption_
        , "cells"       `I.p` cells_
        , "is_bordered" `I.p` is_bordered_
        , "is_striped"  `I.p` is_striped_
        ]
  shortShow PageBlockDetails
    { header  = header_
    , blocks  = blocks_
    , is_open = is_open_
    }
      = "PageBlockDetails"
        ++ I.cc
        [ "header"  `I.p` header_
        , "blocks"  `I.p` blocks_
        , "is_open" `I.p` is_open_
        ]
  shortShow PageBlockRelatedArticles
    { header   = header_
    , articles = articles_
    }
      = "PageBlockRelatedArticles"
        ++ I.cc
        [ "header"   `I.p` header_
        , "articles" `I.p` articles_
        ]
  shortShow PageBlockMap
    { location = location_
    , zoom     = zoom_
    , width    = width_
    , height   = height_
    , caption  = caption_
    }
      = "PageBlockMap"
        ++ I.cc
        [ "location" `I.p` location_
        , "zoom"     `I.p` zoom_
        , "width"    `I.p` width_
        , "height"   `I.p` height_
        , "caption"  `I.p` caption_
        ]

instance AT.FromJSON PageBlock where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "pageBlockTitle"                  -> parsePageBlockTitle v
      "pageBlockSubtitle"               -> parsePageBlockSubtitle v
      "pageBlockAuthorDate"             -> parsePageBlockAuthorDate v
      "pageBlockHeader"                 -> parsePageBlockHeader v
      "pageBlockSubheader"              -> parsePageBlockSubheader v
      "pageBlockSectionHeading"         -> parsePageBlockSectionHeading v
      "pageBlockKicker"                 -> parsePageBlockKicker v
      "pageBlockParagraph"              -> parsePageBlockParagraph v
      "pageBlockPreformatted"           -> parsePageBlockPreformatted v
      "pageBlockFooter"                 -> parsePageBlockFooter v
      "pageBlockThinking"               -> parsePageBlockThinking v
      "pageBlockDivider"                -> pure PageBlockDivider
      "pageBlockMathematicalExpression" -> parsePageBlockMathematicalExpression v
      "pageBlockAnchor"                 -> parsePageBlockAnchor v
      "pageBlockList"                   -> parsePageBlockList v
      "pageBlockBlockQuote"             -> parsePageBlockBlockQuote v
      "pageBlockPullQuote"              -> parsePageBlockPullQuote v
      "pageBlockAnimation"              -> parsePageBlockAnimation v
      "pageBlockAudio"                  -> parsePageBlockAudio v
      "pageBlockPhoto"                  -> parsePageBlockPhoto v
      "pageBlockVideo"                  -> parsePageBlockVideo v
      "pageBlockVoiceNote"              -> parsePageBlockVoiceNote v
      "pageBlockCover"                  -> parsePageBlockCover v
      "pageBlockEmbedded"               -> parsePageBlockEmbedded v
      "pageBlockEmbeddedPost"           -> parsePageBlockEmbeddedPost v
      "pageBlockCollage"                -> parsePageBlockCollage v
      "pageBlockSlideshow"              -> parsePageBlockSlideshow v
      "pageBlockChatLink"               -> parsePageBlockChatLink v
      "pageBlockTable"                  -> parsePageBlockTable v
      "pageBlockDetails"                -> parsePageBlockDetails v
      "pageBlockRelatedArticles"        -> parsePageBlockRelatedArticles v
      "pageBlockMap"                    -> parsePageBlockMap v
      _                                 -> mempty
    
    where
      parsePageBlockTitle :: A.Value -> AT.Parser PageBlock
      parsePageBlockTitle = A.withObject "PageBlockTitle" $ \o -> do
        title_ <- o A..:?  "title"
        pure $ PageBlockTitle
          { title = title_
          }
      parsePageBlockSubtitle :: A.Value -> AT.Parser PageBlock
      parsePageBlockSubtitle = A.withObject "PageBlockSubtitle" $ \o -> do
        subtitle_ <- o A..:?  "subtitle"
        pure $ PageBlockSubtitle
          { subtitle = subtitle_
          }
      parsePageBlockAuthorDate :: A.Value -> AT.Parser PageBlock
      parsePageBlockAuthorDate = A.withObject "PageBlockAuthorDate" $ \o -> do
        author_       <- o A..:?  "author"
        publish_date_ <- o A..:?  "publish_date"
        pure $ PageBlockAuthorDate
          { author       = author_
          , publish_date = publish_date_
          }
      parsePageBlockHeader :: A.Value -> AT.Parser PageBlock
      parsePageBlockHeader = A.withObject "PageBlockHeader" $ \o -> do
        header_ <- o A..:?  "header"
        pure $ PageBlockHeader
          { header = header_
          }
      parsePageBlockSubheader :: A.Value -> AT.Parser PageBlock
      parsePageBlockSubheader = A.withObject "PageBlockSubheader" $ \o -> do
        subheader_ <- o A..:?  "subheader"
        pure $ PageBlockSubheader
          { subheader = subheader_
          }
      parsePageBlockSectionHeading :: A.Value -> AT.Parser PageBlock
      parsePageBlockSectionHeading = A.withObject "PageBlockSectionHeading" $ \o -> do
        text_ <- o A..:?  "text"
        size_ <- o A..:?  "size"
        pure $ PageBlockSectionHeading
          { text = text_
          , size = size_
          }
      parsePageBlockKicker :: A.Value -> AT.Parser PageBlock
      parsePageBlockKicker = A.withObject "PageBlockKicker" $ \o -> do
        kicker_ <- o A..:?  "kicker"
        pure $ PageBlockKicker
          { kicker = kicker_
          }
      parsePageBlockParagraph :: A.Value -> AT.Parser PageBlock
      parsePageBlockParagraph = A.withObject "PageBlockParagraph" $ \o -> do
        text_ <- o A..:?  "text"
        pure $ PageBlockParagraph
          { text = text_
          }
      parsePageBlockPreformatted :: A.Value -> AT.Parser PageBlock
      parsePageBlockPreformatted = A.withObject "PageBlockPreformatted" $ \o -> do
        text_     <- o A..:?  "text"
        language_ <- o A..:?  "language"
        pure $ PageBlockPreformatted
          { text     = text_
          , language = language_
          }
      parsePageBlockFooter :: A.Value -> AT.Parser PageBlock
      parsePageBlockFooter = A.withObject "PageBlockFooter" $ \o -> do
        footer_ <- o A..:?  "footer"
        pure $ PageBlockFooter
          { footer = footer_
          }
      parsePageBlockThinking :: A.Value -> AT.Parser PageBlock
      parsePageBlockThinking = A.withObject "PageBlockThinking" $ \o -> do
        text_ <- o A..:?  "text"
        pure $ PageBlockThinking
          { text = text_
          }
      parsePageBlockMathematicalExpression :: A.Value -> AT.Parser PageBlock
      parsePageBlockMathematicalExpression = A.withObject "PageBlockMathematicalExpression" $ \o -> do
        expression_ <- o A..:?  "expression"
        pure $ PageBlockMathematicalExpression
          { expression = expression_
          }
      parsePageBlockAnchor :: A.Value -> AT.Parser PageBlock
      parsePageBlockAnchor = A.withObject "PageBlockAnchor" $ \o -> do
        name_ <- o A..:?  "name"
        pure $ PageBlockAnchor
          { name = name_
          }
      parsePageBlockList :: A.Value -> AT.Parser PageBlock
      parsePageBlockList = A.withObject "PageBlockList" $ \o -> do
        items_ <- o A..:?  "items"
        pure $ PageBlockList
          { items = items_
          }
      parsePageBlockBlockQuote :: A.Value -> AT.Parser PageBlock
      parsePageBlockBlockQuote = A.withObject "PageBlockBlockQuote" $ \o -> do
        blocks_ <- o A..:?  "blocks"
        credit_ <- o A..:?  "credit"
        pure $ PageBlockBlockQuote
          { blocks = blocks_
          , credit = credit_
          }
      parsePageBlockPullQuote :: A.Value -> AT.Parser PageBlock
      parsePageBlockPullQuote = A.withObject "PageBlockPullQuote" $ \o -> do
        text_   <- o A..:?  "text"
        credit_ <- o A..:?  "credit"
        pure $ PageBlockPullQuote
          { text   = text_
          , credit = credit_
          }
      parsePageBlockAnimation :: A.Value -> AT.Parser PageBlock
      parsePageBlockAnimation = A.withObject "PageBlockAnimation" $ \o -> do
        animation_     <- o A..:?  "animation"
        caption_       <- o A..:?  "caption"
        need_autoplay_ <- o A..:?  "need_autoplay"
        has_spoiler_   <- o A..:?  "has_spoiler"
        pure $ PageBlockAnimation
          { animation     = animation_
          , caption       = caption_
          , need_autoplay = need_autoplay_
          , has_spoiler   = has_spoiler_
          }
      parsePageBlockAudio :: A.Value -> AT.Parser PageBlock
      parsePageBlockAudio = A.withObject "PageBlockAudio" $ \o -> do
        audio_   <- o A..:?  "audio"
        caption_ <- o A..:?  "caption"
        pure $ PageBlockAudio
          { audio   = audio_
          , caption = caption_
          }
      parsePageBlockPhoto :: A.Value -> AT.Parser PageBlock
      parsePageBlockPhoto = A.withObject "PageBlockPhoto" $ \o -> do
        photo_       <- o A..:?  "photo"
        caption_     <- o A..:?  "caption"
        url_         <- o A..:?  "url"
        has_spoiler_ <- o A..:?  "has_spoiler"
        pure $ PageBlockPhoto
          { photo       = photo_
          , caption     = caption_
          , url         = url_
          , has_spoiler = has_spoiler_
          }
      parsePageBlockVideo :: A.Value -> AT.Parser PageBlock
      parsePageBlockVideo = A.withObject "PageBlockVideo" $ \o -> do
        video_         <- o A..:?  "video"
        caption_       <- o A..:?  "caption"
        need_autoplay_ <- o A..:?  "need_autoplay"
        is_looped_     <- o A..:?  "is_looped"
        has_spoiler_   <- o A..:?  "has_spoiler"
        pure $ PageBlockVideo
          { video         = video_
          , caption       = caption_
          , need_autoplay = need_autoplay_
          , is_looped     = is_looped_
          , has_spoiler   = has_spoiler_
          }
      parsePageBlockVoiceNote :: A.Value -> AT.Parser PageBlock
      parsePageBlockVoiceNote = A.withObject "PageBlockVoiceNote" $ \o -> do
        voice_note_ <- o A..:?  "voice_note"
        caption_    <- o A..:?  "caption"
        pure $ PageBlockVoiceNote
          { voice_note = voice_note_
          , caption    = caption_
          }
      parsePageBlockCover :: A.Value -> AT.Parser PageBlock
      parsePageBlockCover = A.withObject "PageBlockCover" $ \o -> do
        cover_ <- o A..:?  "cover"
        pure $ PageBlockCover
          { cover = cover_
          }
      parsePageBlockEmbedded :: A.Value -> AT.Parser PageBlock
      parsePageBlockEmbedded = A.withObject "PageBlockEmbedded" $ \o -> do
        url_             <- o A..:?  "url"
        html_            <- o A..:?  "html"
        poster_photo_    <- o A..:?  "poster_photo"
        width_           <- o A..:?  "width"
        height_          <- o A..:?  "height"
        caption_         <- o A..:?  "caption"
        is_full_width_   <- o A..:?  "is_full_width"
        allow_scrolling_ <- o A..:?  "allow_scrolling"
        pure $ PageBlockEmbedded
          { url             = url_
          , html            = html_
          , poster_photo    = poster_photo_
          , width           = width_
          , height          = height_
          , caption         = caption_
          , is_full_width   = is_full_width_
          , allow_scrolling = allow_scrolling_
          }
      parsePageBlockEmbeddedPost :: A.Value -> AT.Parser PageBlock
      parsePageBlockEmbeddedPost = A.withObject "PageBlockEmbeddedPost" $ \o -> do
        url_          <- o A..:?  "url"
        _author_      <- o A..:?  "author"
        author_photo_ <- o A..:?  "author_photo"
        date_         <- o A..:?  "date"
        blocks_       <- o A..:?  "blocks"
        caption_      <- o A..:?  "caption"
        pure $ PageBlockEmbeddedPost
          { url          = url_
          , _author      = _author_
          , author_photo = author_photo_
          , date         = date_
          , blocks       = blocks_
          , caption      = caption_
          }
      parsePageBlockCollage :: A.Value -> AT.Parser PageBlock
      parsePageBlockCollage = A.withObject "PageBlockCollage" $ \o -> do
        blocks_  <- o A..:?  "blocks"
        caption_ <- o A..:?  "caption"
        pure $ PageBlockCollage
          { blocks  = blocks_
          , caption = caption_
          }
      parsePageBlockSlideshow :: A.Value -> AT.Parser PageBlock
      parsePageBlockSlideshow = A.withObject "PageBlockSlideshow" $ \o -> do
        blocks_  <- o A..:?  "blocks"
        caption_ <- o A..:?  "caption"
        pure $ PageBlockSlideshow
          { blocks  = blocks_
          , caption = caption_
          }
      parsePageBlockChatLink :: A.Value -> AT.Parser PageBlock
      parsePageBlockChatLink = A.withObject "PageBlockChatLink" $ \o -> do
        _title_          <- o A..:?  "title"
        _photo_          <- o A..:?  "photo"
        accent_color_id_ <- o A..:?  "accent_color_id"
        username_        <- o A..:?  "username"
        pure $ PageBlockChatLink
          { _title          = _title_
          , _photo          = _photo_
          , accent_color_id = accent_color_id_
          , username        = username_
          }
      parsePageBlockTable :: A.Value -> AT.Parser PageBlock
      parsePageBlockTable = A.withObject "PageBlockTable" $ \o -> do
        _caption_    <- o A..:?  "caption"
        cells_       <- o A..:?  "cells"
        is_bordered_ <- o A..:?  "is_bordered"
        is_striped_  <- o A..:?  "is_striped"
        pure $ PageBlockTable
          { _caption    = _caption_
          , cells       = cells_
          , is_bordered = is_bordered_
          , is_striped  = is_striped_
          }
      parsePageBlockDetails :: A.Value -> AT.Parser PageBlock
      parsePageBlockDetails = A.withObject "PageBlockDetails" $ \o -> do
        header_  <- o A..:?  "header"
        blocks_  <- o A..:?  "blocks"
        is_open_ <- o A..:?  "is_open"
        pure $ PageBlockDetails
          { header  = header_
          , blocks  = blocks_
          , is_open = is_open_
          }
      parsePageBlockRelatedArticles :: A.Value -> AT.Parser PageBlock
      parsePageBlockRelatedArticles = A.withObject "PageBlockRelatedArticles" $ \o -> do
        header_   <- o A..:?  "header"
        articles_ <- o A..:?  "articles"
        pure $ PageBlockRelatedArticles
          { header   = header_
          , articles = articles_
          }
      parsePageBlockMap :: A.Value -> AT.Parser PageBlock
      parsePageBlockMap = A.withObject "PageBlockMap" $ \o -> do
        location_ <- o A..:?  "location"
        zoom_     <- o A..:?  "zoom"
        width_    <- o A..:?  "width"
        height_   <- o A..:?  "height"
        caption_  <- o A..:?  "caption"
        pure $ PageBlockMap
          { location = location_
          , zoom     = zoom_
          , width    = width_
          , height   = height_
          , caption  = caption_
          }
  parseJSON _ = mempty

instance AT.ToJSON PageBlock where
  toJSON PageBlockTitle
    { title = title_
    }
      = A.object
        [ "@type" A..= AT.String "pageBlockTitle"
        , "title" A..= title_
        ]
  toJSON PageBlockSubtitle
    { subtitle = subtitle_
    }
      = A.object
        [ "@type"    A..= AT.String "pageBlockSubtitle"
        , "subtitle" A..= subtitle_
        ]
  toJSON PageBlockAuthorDate
    { author       = author_
    , publish_date = publish_date_
    }
      = A.object
        [ "@type"        A..= AT.String "pageBlockAuthorDate"
        , "author"       A..= author_
        , "publish_date" A..= publish_date_
        ]
  toJSON PageBlockHeader
    { header = header_
    }
      = A.object
        [ "@type"  A..= AT.String "pageBlockHeader"
        , "header" A..= header_
        ]
  toJSON PageBlockSubheader
    { subheader = subheader_
    }
      = A.object
        [ "@type"     A..= AT.String "pageBlockSubheader"
        , "subheader" A..= subheader_
        ]
  toJSON PageBlockSectionHeading
    { text = text_
    , size = size_
    }
      = A.object
        [ "@type" A..= AT.String "pageBlockSectionHeading"
        , "text"  A..= text_
        , "size"  A..= size_
        ]
  toJSON PageBlockKicker
    { kicker = kicker_
    }
      = A.object
        [ "@type"  A..= AT.String "pageBlockKicker"
        , "kicker" A..= kicker_
        ]
  toJSON PageBlockParagraph
    { text = text_
    }
      = A.object
        [ "@type" A..= AT.String "pageBlockParagraph"
        , "text"  A..= text_
        ]
  toJSON PageBlockPreformatted
    { text     = text_
    , language = language_
    }
      = A.object
        [ "@type"    A..= AT.String "pageBlockPreformatted"
        , "text"     A..= text_
        , "language" A..= language_
        ]
  toJSON PageBlockFooter
    { footer = footer_
    }
      = A.object
        [ "@type"  A..= AT.String "pageBlockFooter"
        , "footer" A..= footer_
        ]
  toJSON PageBlockThinking
    { text = text_
    }
      = A.object
        [ "@type" A..= AT.String "pageBlockThinking"
        , "text"  A..= text_
        ]
  toJSON PageBlockDivider
      = A.object
        [ "@type" A..= AT.String "pageBlockDivider"
        ]
  toJSON PageBlockMathematicalExpression
    { expression = expression_
    }
      = A.object
        [ "@type"      A..= AT.String "pageBlockMathematicalExpression"
        , "expression" A..= expression_
        ]
  toJSON PageBlockAnchor
    { name = name_
    }
      = A.object
        [ "@type" A..= AT.String "pageBlockAnchor"
        , "name"  A..= name_
        ]
  toJSON PageBlockList
    { items = items_
    }
      = A.object
        [ "@type" A..= AT.String "pageBlockList"
        , "items" A..= items_
        ]
  toJSON PageBlockBlockQuote
    { blocks = blocks_
    , credit = credit_
    }
      = A.object
        [ "@type"  A..= AT.String "pageBlockBlockQuote"
        , "blocks" A..= blocks_
        , "credit" A..= credit_
        ]
  toJSON PageBlockPullQuote
    { text   = text_
    , credit = credit_
    }
      = A.object
        [ "@type"  A..= AT.String "pageBlockPullQuote"
        , "text"   A..= text_
        , "credit" A..= credit_
        ]
  toJSON PageBlockAnimation
    { animation     = animation_
    , caption       = caption_
    , need_autoplay = need_autoplay_
    , has_spoiler   = has_spoiler_
    }
      = A.object
        [ "@type"         A..= AT.String "pageBlockAnimation"
        , "animation"     A..= animation_
        , "caption"       A..= caption_
        , "need_autoplay" A..= need_autoplay_
        , "has_spoiler"   A..= has_spoiler_
        ]
  toJSON PageBlockAudio
    { audio   = audio_
    , caption = caption_
    }
      = A.object
        [ "@type"   A..= AT.String "pageBlockAudio"
        , "audio"   A..= audio_
        , "caption" A..= caption_
        ]
  toJSON PageBlockPhoto
    { photo       = photo_
    , caption     = caption_
    , url         = url_
    , has_spoiler = has_spoiler_
    }
      = A.object
        [ "@type"       A..= AT.String "pageBlockPhoto"
        , "photo"       A..= photo_
        , "caption"     A..= caption_
        , "url"         A..= url_
        , "has_spoiler" A..= has_spoiler_
        ]
  toJSON PageBlockVideo
    { video         = video_
    , caption       = caption_
    , need_autoplay = need_autoplay_
    , is_looped     = is_looped_
    , has_spoiler   = has_spoiler_
    }
      = A.object
        [ "@type"         A..= AT.String "pageBlockVideo"
        , "video"         A..= video_
        , "caption"       A..= caption_
        , "need_autoplay" A..= need_autoplay_
        , "is_looped"     A..= is_looped_
        , "has_spoiler"   A..= has_spoiler_
        ]
  toJSON PageBlockVoiceNote
    { voice_note = voice_note_
    , caption    = caption_
    }
      = A.object
        [ "@type"      A..= AT.String "pageBlockVoiceNote"
        , "voice_note" A..= voice_note_
        , "caption"    A..= caption_
        ]
  toJSON PageBlockCover
    { cover = cover_
    }
      = A.object
        [ "@type" A..= AT.String "pageBlockCover"
        , "cover" A..= cover_
        ]
  toJSON PageBlockEmbedded
    { url             = url_
    , html            = html_
    , poster_photo    = poster_photo_
    , width           = width_
    , height          = height_
    , caption         = caption_
    , is_full_width   = is_full_width_
    , allow_scrolling = allow_scrolling_
    }
      = A.object
        [ "@type"           A..= AT.String "pageBlockEmbedded"
        , "url"             A..= url_
        , "html"            A..= html_
        , "poster_photo"    A..= poster_photo_
        , "width"           A..= width_
        , "height"          A..= height_
        , "caption"         A..= caption_
        , "is_full_width"   A..= is_full_width_
        , "allow_scrolling" A..= allow_scrolling_
        ]
  toJSON PageBlockEmbeddedPost
    { url          = url_
    , _author      = _author_
    , author_photo = author_photo_
    , date         = date_
    , blocks       = blocks_
    , caption      = caption_
    }
      = A.object
        [ "@type"        A..= AT.String "pageBlockEmbeddedPost"
        , "url"          A..= url_
        , "author"       A..= _author_
        , "author_photo" A..= author_photo_
        , "date"         A..= date_
        , "blocks"       A..= blocks_
        , "caption"      A..= caption_
        ]
  toJSON PageBlockCollage
    { blocks  = blocks_
    , caption = caption_
    }
      = A.object
        [ "@type"   A..= AT.String "pageBlockCollage"
        , "blocks"  A..= blocks_
        , "caption" A..= caption_
        ]
  toJSON PageBlockSlideshow
    { blocks  = blocks_
    , caption = caption_
    }
      = A.object
        [ "@type"   A..= AT.String "pageBlockSlideshow"
        , "blocks"  A..= blocks_
        , "caption" A..= caption_
        ]
  toJSON PageBlockChatLink
    { _title          = _title_
    , _photo          = _photo_
    , accent_color_id = accent_color_id_
    , username        = username_
    }
      = A.object
        [ "@type"           A..= AT.String "pageBlockChatLink"
        , "title"           A..= _title_
        , "photo"           A..= _photo_
        , "accent_color_id" A..= accent_color_id_
        , "username"        A..= username_
        ]
  toJSON PageBlockTable
    { _caption    = _caption_
    , cells       = cells_
    , is_bordered = is_bordered_
    , is_striped  = is_striped_
    }
      = A.object
        [ "@type"       A..= AT.String "pageBlockTable"
        , "caption"     A..= _caption_
        , "cells"       A..= cells_
        , "is_bordered" A..= is_bordered_
        , "is_striped"  A..= is_striped_
        ]
  toJSON PageBlockDetails
    { header  = header_
    , blocks  = blocks_
    , is_open = is_open_
    }
      = A.object
        [ "@type"   A..= AT.String "pageBlockDetails"
        , "header"  A..= header_
        , "blocks"  A..= blocks_
        , "is_open" A..= is_open_
        ]
  toJSON PageBlockRelatedArticles
    { header   = header_
    , articles = articles_
    }
      = A.object
        [ "@type"    A..= AT.String "pageBlockRelatedArticles"
        , "header"   A..= header_
        , "articles" A..= articles_
        ]
  toJSON PageBlockMap
    { location = location_
    , zoom     = zoom_
    , width    = width_
    , height   = height_
    , caption  = caption_
    }
      = A.object
        [ "@type"    A..= AT.String "pageBlockMap"
        , "location" A..= location_
        , "zoom"     A..= zoom_
        , "width"    A..= width_
        , "height"   A..= height_
        , "caption"  A..= caption_
        ]

