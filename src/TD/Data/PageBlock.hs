{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PageBlock where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Animation as Animation
import qualified TD.Data.Audio as Audio
import qualified TD.Data.ChatPhotoInfo as ChatPhotoInfo
import qualified TD.Data.Location as Location
import qualified TD.Data.PageBlockCaption as PageBlockCaption
import {-# SOURCE #-} qualified TD.Data.PageBlockListItem as PageBlockListItem
import qualified TD.Data.PageBlockRelatedArticle as PageBlockRelatedArticle
import qualified TD.Data.PageBlockTableCell as PageBlockTableCell
import qualified TD.Data.Photo as Photo
import qualified TD.Data.RichText as RichText
import qualified TD.Data.Video as Video
import qualified TD.Data.VoiceNote as VoiceNote
import qualified Utils as U

-- | Describes a block of an instant view web page
data PageBlock
  = -- | The title of a page @title Title
    PageBlockTitle
      { -- |
        title :: Maybe RichText.RichText
      }
  | -- | The subtitle of a page @subtitle Subtitle
    PageBlockSubtitle
      { -- |
        subtitle :: Maybe RichText.RichText
      }
  | -- | The author and publishing date of a page @author Author @publish_date Point in time (Unix timestamp) when the article was published; 0 if unknown
    PageBlockAuthorDate
      { -- |
        publish_date :: Maybe Int,
        -- |
        author :: Maybe RichText.RichText
      }
  | -- | A header @header Header
    PageBlockHeader
      { -- |
        header :: Maybe RichText.RichText
      }
  | -- | A subheader @subheader Subheader
    PageBlockSubheader
      { -- |
        subheader :: Maybe RichText.RichText
      }
  | -- | A kicker @kicker Kicker
    PageBlockKicker
      { -- |
        kicker :: Maybe RichText.RichText
      }
  | -- | A text paragraph @text Paragraph text
    PageBlockParagraph
      { -- |
        text :: Maybe RichText.RichText
      }
  | -- | A preformatted text paragraph @text Paragraph text @language Programming language for which the text needs to be formatted
    PageBlockPreformatted
      { -- |
        language :: Maybe String,
        -- |
        text :: Maybe RichText.RichText
      }
  | -- | The footer of a page @footer Footer
    PageBlockFooter
      { -- |
        footer :: Maybe RichText.RichText
      }
  | -- | An empty block separating a page
    PageBlockDivider
  | -- | An invisible anchor on a page, which can be used in a URL to open the page from the specified anchor @name Name of the anchor
    PageBlockAnchor
      { -- |
        name :: Maybe String
      }
  | -- | A list of data blocks @items The items of the list
    PageBlockList
      { -- |
        items :: Maybe [PageBlockListItem.PageBlockListItem]
      }
  | -- | A block quote @text Quote text @credit Quote credit
    PageBlockBlockQuote
      { -- |
        credit :: Maybe RichText.RichText,
        -- |
        text :: Maybe RichText.RichText
      }
  | -- | A pull quote @text Quote text @credit Quote credit
    PageBlockPullQuote
      { -- |
        credit :: Maybe RichText.RichText,
        -- |
        text :: Maybe RichText.RichText
      }
  | -- | An animation @animation Animation file; may be null @caption Animation caption @need_autoplay True, if the animation must be played automatically
    PageBlockAnimation
      { -- |
        need_autoplay :: Maybe Bool,
        -- |
        caption :: Maybe PageBlockCaption.PageBlockCaption,
        -- |
        animation :: Maybe Animation.Animation
      }
  | -- | An audio file @audio Audio file; may be null @caption Audio file caption
    PageBlockAudio
      { -- |
        caption :: Maybe PageBlockCaption.PageBlockCaption,
        -- |
        audio :: Maybe Audio.Audio
      }
  | -- | A photo @photo Photo file; may be null @caption Photo caption @url URL that needs to be opened when the photo is clicked
    PageBlockPhoto
      { -- |
        url :: Maybe String,
        -- |
        caption :: Maybe PageBlockCaption.PageBlockCaption,
        -- |
        photo :: Maybe Photo.Photo
      }
  | -- | A video @video Video file; may be null @caption Video caption @need_autoplay True, if the video must be played automatically @is_looped True, if the video must be looped
    PageBlockVideo
      { -- |
        is_looped :: Maybe Bool,
        -- |
        need_autoplay :: Maybe Bool,
        -- |
        caption :: Maybe PageBlockCaption.PageBlockCaption,
        -- |
        video :: Maybe Video.Video
      }
  | -- | A voice note @voice_note Voice note; may be null @caption Voice note caption
    PageBlockVoiceNote
      { -- |
        caption :: Maybe PageBlockCaption.PageBlockCaption,
        -- |
        voice_note :: Maybe VoiceNote.VoiceNote
      }
  | -- | A page cover @cover Cover
    PageBlockCover
      { -- |
        cover :: Maybe PageBlock
      }
  | -- | An embedded web page @url Web page URL, if available @html HTML-markup of the embedded page @poster_photo Poster photo, if available; may be null @width Block width; 0 if unknown @height Block height; 0 if unknown @caption Block caption @is_full_width True, if the block must be full width @allow_scrolling True, if scrolling needs to be allowed
    PageBlockEmbedded
      { -- |
        allow_scrolling :: Maybe Bool,
        -- |
        is_full_width :: Maybe Bool,
        -- |
        caption :: Maybe PageBlockCaption.PageBlockCaption,
        -- |
        height :: Maybe Int,
        -- |
        width :: Maybe Int,
        -- |
        poster_photo :: Maybe Photo.Photo,
        -- |
        html :: Maybe String,
        -- |
        url :: Maybe String
      }
  | -- | An embedded post @url Web page URL @author Post author @author_photo Post author photo; may be null @date Point in time (Unix timestamp) when the post was created; 0 if unknown @page_blocks Post content @caption Post caption
    PageBlockEmbeddedPost
      { -- |
        caption :: Maybe PageBlockCaption.PageBlockCaption,
        -- |
        page_blocks :: Maybe [PageBlock],
        -- |
        date :: Maybe Int,
        -- |
        author_photo :: Maybe Photo.Photo,
        -- |
        _author :: Maybe String,
        -- |
        url :: Maybe String
      }
  | -- | A collage @page_blocks Collage item contents @caption Block caption
    PageBlockCollage
      { -- |
        caption :: Maybe PageBlockCaption.PageBlockCaption,
        -- |
        page_blocks :: Maybe [PageBlock]
      }
  | -- | A slideshow @page_blocks Slideshow item contents @caption Block caption
    PageBlockSlideshow
      { -- |
        caption :: Maybe PageBlockCaption.PageBlockCaption,
        -- |
        page_blocks :: Maybe [PageBlock]
      }
  | -- | A link to a chat @title Chat title @photo Chat photo; may be null @username Chat username by which all other information about the chat can be resolved
    PageBlockChatLink
      { -- |
        username :: Maybe String,
        -- |
        _photo :: Maybe ChatPhotoInfo.ChatPhotoInfo,
        -- |
        _title :: Maybe String
      }
  | -- | A table @caption Table caption @cells Table cells @is_bordered True, if the table is bordered @is_striped True, if the table is striped
    PageBlockTable
      { -- |
        is_striped :: Maybe Bool,
        -- |
        is_bordered :: Maybe Bool,
        -- |
        cells :: Maybe [[PageBlockTableCell.PageBlockTableCell]],
        -- |
        _caption :: Maybe RichText.RichText
      }
  | -- | A collapsible block @header Always visible heading for the block @page_blocks Block contents @is_open True, if the block is open by default
    PageBlockDetails
      { -- |
        is_open :: Maybe Bool,
        -- |
        page_blocks :: Maybe [PageBlock],
        -- |
        header :: Maybe RichText.RichText
      }
  | -- | Related articles @header Block header @articles List of related articles
    PageBlockRelatedArticles
      { -- |
        articles :: Maybe [PageBlockRelatedArticle.PageBlockRelatedArticle],
        -- |
        header :: Maybe RichText.RichText
      }
  | -- | A map @location Location of the map center @zoom Map zoom level @width Map width @height Map height @caption Block caption
    PageBlockMap
      { -- |
        caption :: Maybe PageBlockCaption.PageBlockCaption,
        -- |
        height :: Maybe Int,
        -- |
        width :: Maybe Int,
        -- |
        zoom :: Maybe Int,
        -- |
        location :: Maybe Location.Location
      }
  deriving (Eq)

instance Show PageBlock where
  show
    PageBlockTitle
      { title = title_
      } =
      "PageBlockTitle"
        ++ U.cc
          [ U.p "title" title_
          ]
  show
    PageBlockSubtitle
      { subtitle = subtitle_
      } =
      "PageBlockSubtitle"
        ++ U.cc
          [ U.p "subtitle" subtitle_
          ]
  show
    PageBlockAuthorDate
      { publish_date = publish_date_,
        author = author_
      } =
      "PageBlockAuthorDate"
        ++ U.cc
          [ U.p "publish_date" publish_date_,
            U.p "author" author_
          ]
  show
    PageBlockHeader
      { header = header_
      } =
      "PageBlockHeader"
        ++ U.cc
          [ U.p "header" header_
          ]
  show
    PageBlockSubheader
      { subheader = subheader_
      } =
      "PageBlockSubheader"
        ++ U.cc
          [ U.p "subheader" subheader_
          ]
  show
    PageBlockKicker
      { kicker = kicker_
      } =
      "PageBlockKicker"
        ++ U.cc
          [ U.p "kicker" kicker_
          ]
  show
    PageBlockParagraph
      { text = text_
      } =
      "PageBlockParagraph"
        ++ U.cc
          [ U.p "text" text_
          ]
  show
    PageBlockPreformatted
      { language = language_,
        text = text_
      } =
      "PageBlockPreformatted"
        ++ U.cc
          [ U.p "language" language_,
            U.p "text" text_
          ]
  show
    PageBlockFooter
      { footer = footer_
      } =
      "PageBlockFooter"
        ++ U.cc
          [ U.p "footer" footer_
          ]
  show PageBlockDivider =
    "PageBlockDivider"
      ++ U.cc
        []
  show
    PageBlockAnchor
      { name = name_
      } =
      "PageBlockAnchor"
        ++ U.cc
          [ U.p "name" name_
          ]
  show
    PageBlockList
      { items = items_
      } =
      "PageBlockList"
        ++ U.cc
          [ U.p "items" items_
          ]
  show
    PageBlockBlockQuote
      { credit = credit_,
        text = text_
      } =
      "PageBlockBlockQuote"
        ++ U.cc
          [ U.p "credit" credit_,
            U.p "text" text_
          ]
  show
    PageBlockPullQuote
      { credit = credit_,
        text = text_
      } =
      "PageBlockPullQuote"
        ++ U.cc
          [ U.p "credit" credit_,
            U.p "text" text_
          ]
  show
    PageBlockAnimation
      { need_autoplay = need_autoplay_,
        caption = caption_,
        animation = animation_
      } =
      "PageBlockAnimation"
        ++ U.cc
          [ U.p "need_autoplay" need_autoplay_,
            U.p "caption" caption_,
            U.p "animation" animation_
          ]
  show
    PageBlockAudio
      { caption = caption_,
        audio = audio_
      } =
      "PageBlockAudio"
        ++ U.cc
          [ U.p "caption" caption_,
            U.p "audio" audio_
          ]
  show
    PageBlockPhoto
      { url = url_,
        caption = caption_,
        photo = photo_
      } =
      "PageBlockPhoto"
        ++ U.cc
          [ U.p "url" url_,
            U.p "caption" caption_,
            U.p "photo" photo_
          ]
  show
    PageBlockVideo
      { is_looped = is_looped_,
        need_autoplay = need_autoplay_,
        caption = caption_,
        video = video_
      } =
      "PageBlockVideo"
        ++ U.cc
          [ U.p "is_looped" is_looped_,
            U.p "need_autoplay" need_autoplay_,
            U.p "caption" caption_,
            U.p "video" video_
          ]
  show
    PageBlockVoiceNote
      { caption = caption_,
        voice_note = voice_note_
      } =
      "PageBlockVoiceNote"
        ++ U.cc
          [ U.p "caption" caption_,
            U.p "voice_note" voice_note_
          ]
  show
    PageBlockCover
      { cover = cover_
      } =
      "PageBlockCover"
        ++ U.cc
          [ U.p "cover" cover_
          ]
  show
    PageBlockEmbedded
      { allow_scrolling = allow_scrolling_,
        is_full_width = is_full_width_,
        caption = caption_,
        height = height_,
        width = width_,
        poster_photo = poster_photo_,
        html = html_,
        url = url_
      } =
      "PageBlockEmbedded"
        ++ U.cc
          [ U.p "allow_scrolling" allow_scrolling_,
            U.p "is_full_width" is_full_width_,
            U.p "caption" caption_,
            U.p "height" height_,
            U.p "width" width_,
            U.p "poster_photo" poster_photo_,
            U.p "html" html_,
            U.p "url" url_
          ]
  show
    PageBlockEmbeddedPost
      { caption = caption_,
        page_blocks = page_blocks_,
        date = date_,
        author_photo = author_photo_,
        _author = _author_,
        url = url_
      } =
      "PageBlockEmbeddedPost"
        ++ U.cc
          [ U.p "caption" caption_,
            U.p "page_blocks" page_blocks_,
            U.p "date" date_,
            U.p "author_photo" author_photo_,
            U.p "_author" _author_,
            U.p "url" url_
          ]
  show
    PageBlockCollage
      { caption = caption_,
        page_blocks = page_blocks_
      } =
      "PageBlockCollage"
        ++ U.cc
          [ U.p "caption" caption_,
            U.p "page_blocks" page_blocks_
          ]
  show
    PageBlockSlideshow
      { caption = caption_,
        page_blocks = page_blocks_
      } =
      "PageBlockSlideshow"
        ++ U.cc
          [ U.p "caption" caption_,
            U.p "page_blocks" page_blocks_
          ]
  show
    PageBlockChatLink
      { username = username_,
        _photo = _photo_,
        _title = _title_
      } =
      "PageBlockChatLink"
        ++ U.cc
          [ U.p "username" username_,
            U.p "_photo" _photo_,
            U.p "_title" _title_
          ]
  show
    PageBlockTable
      { is_striped = is_striped_,
        is_bordered = is_bordered_,
        cells = cells_,
        _caption = _caption_
      } =
      "PageBlockTable"
        ++ U.cc
          [ U.p "is_striped" is_striped_,
            U.p "is_bordered" is_bordered_,
            U.p "cells" cells_,
            U.p "_caption" _caption_
          ]
  show
    PageBlockDetails
      { is_open = is_open_,
        page_blocks = page_blocks_,
        header = header_
      } =
      "PageBlockDetails"
        ++ U.cc
          [ U.p "is_open" is_open_,
            U.p "page_blocks" page_blocks_,
            U.p "header" header_
          ]
  show
    PageBlockRelatedArticles
      { articles = articles_,
        header = header_
      } =
      "PageBlockRelatedArticles"
        ++ U.cc
          [ U.p "articles" articles_,
            U.p "header" header_
          ]
  show
    PageBlockMap
      { caption = caption_,
        height = height_,
        width = width_,
        zoom = zoom_,
        location = location_
      } =
      "PageBlockMap"
        ++ U.cc
          [ U.p "caption" caption_,
            U.p "height" height_,
            U.p "width" width_,
            U.p "zoom" zoom_,
            U.p "location" location_
          ]

instance T.FromJSON PageBlock where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "pageBlockTitle" -> parsePageBlockTitle v
      "pageBlockSubtitle" -> parsePageBlockSubtitle v
      "pageBlockAuthorDate" -> parsePageBlockAuthorDate v
      "pageBlockHeader" -> parsePageBlockHeader v
      "pageBlockSubheader" -> parsePageBlockSubheader v
      "pageBlockKicker" -> parsePageBlockKicker v
      "pageBlockParagraph" -> parsePageBlockParagraph v
      "pageBlockPreformatted" -> parsePageBlockPreformatted v
      "pageBlockFooter" -> parsePageBlockFooter v
      "pageBlockDivider" -> parsePageBlockDivider v
      "pageBlockAnchor" -> parsePageBlockAnchor v
      "pageBlockList" -> parsePageBlockList v
      "pageBlockBlockQuote" -> parsePageBlockBlockQuote v
      "pageBlockPullQuote" -> parsePageBlockPullQuote v
      "pageBlockAnimation" -> parsePageBlockAnimation v
      "pageBlockAudio" -> parsePageBlockAudio v
      "pageBlockPhoto" -> parsePageBlockPhoto v
      "pageBlockVideo" -> parsePageBlockVideo v
      "pageBlockVoiceNote" -> parsePageBlockVoiceNote v
      "pageBlockCover" -> parsePageBlockCover v
      "pageBlockEmbedded" -> parsePageBlockEmbedded v
      "pageBlockEmbeddedPost" -> parsePageBlockEmbeddedPost v
      "pageBlockCollage" -> parsePageBlockCollage v
      "pageBlockSlideshow" -> parsePageBlockSlideshow v
      "pageBlockChatLink" -> parsePageBlockChatLink v
      "pageBlockTable" -> parsePageBlockTable v
      "pageBlockDetails" -> parsePageBlockDetails v
      "pageBlockRelatedArticles" -> parsePageBlockRelatedArticles v
      "pageBlockMap" -> parsePageBlockMap v
      _ -> mempty
    where
      parsePageBlockTitle :: A.Value -> T.Parser PageBlock
      parsePageBlockTitle = A.withObject "PageBlockTitle" $ \o -> do
        title_ <- o A..:? "title"
        return $ PageBlockTitle {title = title_}

      parsePageBlockSubtitle :: A.Value -> T.Parser PageBlock
      parsePageBlockSubtitle = A.withObject "PageBlockSubtitle" $ \o -> do
        subtitle_ <- o A..:? "subtitle"
        return $ PageBlockSubtitle {subtitle = subtitle_}

      parsePageBlockAuthorDate :: A.Value -> T.Parser PageBlock
      parsePageBlockAuthorDate = A.withObject "PageBlockAuthorDate" $ \o -> do
        publish_date_ <- mconcat [o A..:? "publish_date", U.rm <$> (o A..: "publish_date" :: T.Parser String)] :: T.Parser (Maybe Int)
        author_ <- o A..:? "author"
        return $ PageBlockAuthorDate {publish_date = publish_date_, author = author_}

      parsePageBlockHeader :: A.Value -> T.Parser PageBlock
      parsePageBlockHeader = A.withObject "PageBlockHeader" $ \o -> do
        header_ <- o A..:? "header"
        return $ PageBlockHeader {header = header_}

      parsePageBlockSubheader :: A.Value -> T.Parser PageBlock
      parsePageBlockSubheader = A.withObject "PageBlockSubheader" $ \o -> do
        subheader_ <- o A..:? "subheader"
        return $ PageBlockSubheader {subheader = subheader_}

      parsePageBlockKicker :: A.Value -> T.Parser PageBlock
      parsePageBlockKicker = A.withObject "PageBlockKicker" $ \o -> do
        kicker_ <- o A..:? "kicker"
        return $ PageBlockKicker {kicker = kicker_}

      parsePageBlockParagraph :: A.Value -> T.Parser PageBlock
      parsePageBlockParagraph = A.withObject "PageBlockParagraph" $ \o -> do
        text_ <- o A..:? "text"
        return $ PageBlockParagraph {text = text_}

      parsePageBlockPreformatted :: A.Value -> T.Parser PageBlock
      parsePageBlockPreformatted = A.withObject "PageBlockPreformatted" $ \o -> do
        language_ <- o A..:? "language"
        text_ <- o A..:? "text"
        return $ PageBlockPreformatted {language = language_, text = text_}

      parsePageBlockFooter :: A.Value -> T.Parser PageBlock
      parsePageBlockFooter = A.withObject "PageBlockFooter" $ \o -> do
        footer_ <- o A..:? "footer"
        return $ PageBlockFooter {footer = footer_}

      parsePageBlockDivider :: A.Value -> T.Parser PageBlock
      parsePageBlockDivider = A.withObject "PageBlockDivider" $ \_ -> return PageBlockDivider

      parsePageBlockAnchor :: A.Value -> T.Parser PageBlock
      parsePageBlockAnchor = A.withObject "PageBlockAnchor" $ \o -> do
        name_ <- o A..:? "name"
        return $ PageBlockAnchor {name = name_}

      parsePageBlockList :: A.Value -> T.Parser PageBlock
      parsePageBlockList = A.withObject "PageBlockList" $ \o -> do
        items_ <- o A..:? "items"
        return $ PageBlockList {items = items_}

      parsePageBlockBlockQuote :: A.Value -> T.Parser PageBlock
      parsePageBlockBlockQuote = A.withObject "PageBlockBlockQuote" $ \o -> do
        credit_ <- o A..:? "credit"
        text_ <- o A..:? "text"
        return $ PageBlockBlockQuote {credit = credit_, text = text_}

      parsePageBlockPullQuote :: A.Value -> T.Parser PageBlock
      parsePageBlockPullQuote = A.withObject "PageBlockPullQuote" $ \o -> do
        credit_ <- o A..:? "credit"
        text_ <- o A..:? "text"
        return $ PageBlockPullQuote {credit = credit_, text = text_}

      parsePageBlockAnimation :: A.Value -> T.Parser PageBlock
      parsePageBlockAnimation = A.withObject "PageBlockAnimation" $ \o -> do
        need_autoplay_ <- o A..:? "need_autoplay"
        caption_ <- o A..:? "caption"
        animation_ <- o A..:? "animation"
        return $ PageBlockAnimation {need_autoplay = need_autoplay_, caption = caption_, animation = animation_}

      parsePageBlockAudio :: A.Value -> T.Parser PageBlock
      parsePageBlockAudio = A.withObject "PageBlockAudio" $ \o -> do
        caption_ <- o A..:? "caption"
        audio_ <- o A..:? "audio"
        return $ PageBlockAudio {caption = caption_, audio = audio_}

      parsePageBlockPhoto :: A.Value -> T.Parser PageBlock
      parsePageBlockPhoto = A.withObject "PageBlockPhoto" $ \o -> do
        url_ <- o A..:? "url"
        caption_ <- o A..:? "caption"
        photo_ <- o A..:? "photo"
        return $ PageBlockPhoto {url = url_, caption = caption_, photo = photo_}

      parsePageBlockVideo :: A.Value -> T.Parser PageBlock
      parsePageBlockVideo = A.withObject "PageBlockVideo" $ \o -> do
        is_looped_ <- o A..:? "is_looped"
        need_autoplay_ <- o A..:? "need_autoplay"
        caption_ <- o A..:? "caption"
        video_ <- o A..:? "video"
        return $ PageBlockVideo {is_looped = is_looped_, need_autoplay = need_autoplay_, caption = caption_, video = video_}

      parsePageBlockVoiceNote :: A.Value -> T.Parser PageBlock
      parsePageBlockVoiceNote = A.withObject "PageBlockVoiceNote" $ \o -> do
        caption_ <- o A..:? "caption"
        voice_note_ <- o A..:? "voice_note"
        return $ PageBlockVoiceNote {caption = caption_, voice_note = voice_note_}

      parsePageBlockCover :: A.Value -> T.Parser PageBlock
      parsePageBlockCover = A.withObject "PageBlockCover" $ \o -> do
        cover_ <- o A..:? "cover"
        return $ PageBlockCover {cover = cover_}

      parsePageBlockEmbedded :: A.Value -> T.Parser PageBlock
      parsePageBlockEmbedded = A.withObject "PageBlockEmbedded" $ \o -> do
        allow_scrolling_ <- o A..:? "allow_scrolling"
        is_full_width_ <- o A..:? "is_full_width"
        caption_ <- o A..:? "caption"
        height_ <- mconcat [o A..:? "height", U.rm <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
        width_ <- mconcat [o A..:? "width", U.rm <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
        poster_photo_ <- o A..:? "poster_photo"
        html_ <- o A..:? "html"
        url_ <- o A..:? "url"
        return $ PageBlockEmbedded {allow_scrolling = allow_scrolling_, is_full_width = is_full_width_, caption = caption_, height = height_, width = width_, poster_photo = poster_photo_, html = html_, url = url_}

      parsePageBlockEmbeddedPost :: A.Value -> T.Parser PageBlock
      parsePageBlockEmbeddedPost = A.withObject "PageBlockEmbeddedPost" $ \o -> do
        caption_ <- o A..:? "caption"
        page_blocks_ <- o A..:? "page_blocks"
        date_ <- mconcat [o A..:? "date", U.rm <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
        author_photo_ <- o A..:? "author_photo"
        _author_ <- o A..:? "author"
        url_ <- o A..:? "url"
        return $ PageBlockEmbeddedPost {caption = caption_, page_blocks = page_blocks_, date = date_, author_photo = author_photo_, _author = _author_, url = url_}

      parsePageBlockCollage :: A.Value -> T.Parser PageBlock
      parsePageBlockCollage = A.withObject "PageBlockCollage" $ \o -> do
        caption_ <- o A..:? "caption"
        page_blocks_ <- o A..:? "page_blocks"
        return $ PageBlockCollage {caption = caption_, page_blocks = page_blocks_}

      parsePageBlockSlideshow :: A.Value -> T.Parser PageBlock
      parsePageBlockSlideshow = A.withObject "PageBlockSlideshow" $ \o -> do
        caption_ <- o A..:? "caption"
        page_blocks_ <- o A..:? "page_blocks"
        return $ PageBlockSlideshow {caption = caption_, page_blocks = page_blocks_}

      parsePageBlockChatLink :: A.Value -> T.Parser PageBlock
      parsePageBlockChatLink = A.withObject "PageBlockChatLink" $ \o -> do
        username_ <- o A..:? "username"
        _photo_ <- o A..:? "photo"
        _title_ <- o A..:? "title"
        return $ PageBlockChatLink {username = username_, _photo = _photo_, _title = _title_}

      parsePageBlockTable :: A.Value -> T.Parser PageBlock
      parsePageBlockTable = A.withObject "PageBlockTable" $ \o -> do
        is_striped_ <- o A..:? "is_striped"
        is_bordered_ <- o A..:? "is_bordered"
        cells_ <- o A..:? "cells"
        _caption_ <- o A..:? "caption"
        return $ PageBlockTable {is_striped = is_striped_, is_bordered = is_bordered_, cells = cells_, _caption = _caption_}

      parsePageBlockDetails :: A.Value -> T.Parser PageBlock
      parsePageBlockDetails = A.withObject "PageBlockDetails" $ \o -> do
        is_open_ <- o A..:? "is_open"
        page_blocks_ <- o A..:? "page_blocks"
        header_ <- o A..:? "header"
        return $ PageBlockDetails {is_open = is_open_, page_blocks = page_blocks_, header = header_}

      parsePageBlockRelatedArticles :: A.Value -> T.Parser PageBlock
      parsePageBlockRelatedArticles = A.withObject "PageBlockRelatedArticles" $ \o -> do
        articles_ <- o A..:? "articles"
        header_ <- o A..:? "header"
        return $ PageBlockRelatedArticles {articles = articles_, header = header_}

      parsePageBlockMap :: A.Value -> T.Parser PageBlock
      parsePageBlockMap = A.withObject "PageBlockMap" $ \o -> do
        caption_ <- o A..:? "caption"
        height_ <- mconcat [o A..:? "height", U.rm <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
        width_ <- mconcat [o A..:? "width", U.rm <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
        zoom_ <- mconcat [o A..:? "zoom", U.rm <$> (o A..: "zoom" :: T.Parser String)] :: T.Parser (Maybe Int)
        location_ <- o A..:? "location"
        return $ PageBlockMap {caption = caption_, height = height_, width = width_, zoom = zoom_, location = location_}
  parseJSON _ = mempty

instance T.ToJSON PageBlock where
  toJSON
    PageBlockTitle
      { title = title_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockTitle",
          "title" A..= title_
        ]
  toJSON
    PageBlockSubtitle
      { subtitle = subtitle_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockSubtitle",
          "subtitle" A..= subtitle_
        ]
  toJSON
    PageBlockAuthorDate
      { publish_date = publish_date_,
        author = author_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockAuthorDate",
          "publish_date" A..= publish_date_,
          "author" A..= author_
        ]
  toJSON
    PageBlockHeader
      { header = header_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockHeader",
          "header" A..= header_
        ]
  toJSON
    PageBlockSubheader
      { subheader = subheader_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockSubheader",
          "subheader" A..= subheader_
        ]
  toJSON
    PageBlockKicker
      { kicker = kicker_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockKicker",
          "kicker" A..= kicker_
        ]
  toJSON
    PageBlockParagraph
      { text = text_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockParagraph",
          "text" A..= text_
        ]
  toJSON
    PageBlockPreformatted
      { language = language_,
        text = text_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockPreformatted",
          "language" A..= language_,
          "text" A..= text_
        ]
  toJSON
    PageBlockFooter
      { footer = footer_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockFooter",
          "footer" A..= footer_
        ]
  toJSON PageBlockDivider =
    A.object
      [ "@type" A..= T.String "pageBlockDivider"
      ]
  toJSON
    PageBlockAnchor
      { name = name_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockAnchor",
          "name" A..= name_
        ]
  toJSON
    PageBlockList
      { items = items_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockList",
          "items" A..= items_
        ]
  toJSON
    PageBlockBlockQuote
      { credit = credit_,
        text = text_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockBlockQuote",
          "credit" A..= credit_,
          "text" A..= text_
        ]
  toJSON
    PageBlockPullQuote
      { credit = credit_,
        text = text_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockPullQuote",
          "credit" A..= credit_,
          "text" A..= text_
        ]
  toJSON
    PageBlockAnimation
      { need_autoplay = need_autoplay_,
        caption = caption_,
        animation = animation_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockAnimation",
          "need_autoplay" A..= need_autoplay_,
          "caption" A..= caption_,
          "animation" A..= animation_
        ]
  toJSON
    PageBlockAudio
      { caption = caption_,
        audio = audio_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockAudio",
          "caption" A..= caption_,
          "audio" A..= audio_
        ]
  toJSON
    PageBlockPhoto
      { url = url_,
        caption = caption_,
        photo = photo_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockPhoto",
          "url" A..= url_,
          "caption" A..= caption_,
          "photo" A..= photo_
        ]
  toJSON
    PageBlockVideo
      { is_looped = is_looped_,
        need_autoplay = need_autoplay_,
        caption = caption_,
        video = video_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockVideo",
          "is_looped" A..= is_looped_,
          "need_autoplay" A..= need_autoplay_,
          "caption" A..= caption_,
          "video" A..= video_
        ]
  toJSON
    PageBlockVoiceNote
      { caption = caption_,
        voice_note = voice_note_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockVoiceNote",
          "caption" A..= caption_,
          "voice_note" A..= voice_note_
        ]
  toJSON
    PageBlockCover
      { cover = cover_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockCover",
          "cover" A..= cover_
        ]
  toJSON
    PageBlockEmbedded
      { allow_scrolling = allow_scrolling_,
        is_full_width = is_full_width_,
        caption = caption_,
        height = height_,
        width = width_,
        poster_photo = poster_photo_,
        html = html_,
        url = url_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockEmbedded",
          "allow_scrolling" A..= allow_scrolling_,
          "is_full_width" A..= is_full_width_,
          "caption" A..= caption_,
          "height" A..= height_,
          "width" A..= width_,
          "poster_photo" A..= poster_photo_,
          "html" A..= html_,
          "url" A..= url_
        ]
  toJSON
    PageBlockEmbeddedPost
      { caption = caption_,
        page_blocks = page_blocks_,
        date = date_,
        author_photo = author_photo_,
        _author = _author_,
        url = url_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockEmbeddedPost",
          "caption" A..= caption_,
          "page_blocks" A..= page_blocks_,
          "date" A..= date_,
          "author_photo" A..= author_photo_,
          "author" A..= _author_,
          "url" A..= url_
        ]
  toJSON
    PageBlockCollage
      { caption = caption_,
        page_blocks = page_blocks_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockCollage",
          "caption" A..= caption_,
          "page_blocks" A..= page_blocks_
        ]
  toJSON
    PageBlockSlideshow
      { caption = caption_,
        page_blocks = page_blocks_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockSlideshow",
          "caption" A..= caption_,
          "page_blocks" A..= page_blocks_
        ]
  toJSON
    PageBlockChatLink
      { username = username_,
        _photo = _photo_,
        _title = _title_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockChatLink",
          "username" A..= username_,
          "photo" A..= _photo_,
          "title" A..= _title_
        ]
  toJSON
    PageBlockTable
      { is_striped = is_striped_,
        is_bordered = is_bordered_,
        cells = cells_,
        _caption = _caption_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockTable",
          "is_striped" A..= is_striped_,
          "is_bordered" A..= is_bordered_,
          "cells" A..= cells_,
          "caption" A..= _caption_
        ]
  toJSON
    PageBlockDetails
      { is_open = is_open_,
        page_blocks = page_blocks_,
        header = header_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockDetails",
          "is_open" A..= is_open_,
          "page_blocks" A..= page_blocks_,
          "header" A..= header_
        ]
  toJSON
    PageBlockRelatedArticles
      { articles = articles_,
        header = header_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockRelatedArticles",
          "articles" A..= articles_,
          "header" A..= header_
        ]
  toJSON
    PageBlockMap
      { caption = caption_,
        height = height_,
        width = width_,
        zoom = zoom_,
        location = location_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockMap",
          "caption" A..= caption_,
          "height" A..= height_,
          "width" A..= width_,
          "zoom" A..= zoom_,
          "location" A..= location_
        ]
