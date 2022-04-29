-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PageBlock where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.PageBlockListItem as PageBlockListItem
import {-# SOURCE #-} qualified API.Animation as Animation
import {-# SOURCE #-} qualified API.Audio as Audio
import {-# SOURCE #-} qualified API.Video as Video
import {-# SOURCE #-} qualified API.VoiceNote as VoiceNote
import {-# SOURCE #-} qualified API.Photo as Photo
import {-# SOURCE #-} qualified API.ChatPhotoInfo as ChatPhotoInfo
import {-# SOURCE #-} qualified API.PageBlockTableCell as PageBlockTableCell
import {-# SOURCE #-} qualified API.PageBlockRelatedArticle as PageBlockRelatedArticle
import {-# SOURCE #-} qualified API.RichText as RichText
import {-# SOURCE #-} qualified API.PageBlockCaption as PageBlockCaption
import {-# SOURCE #-} qualified API.Location as Location

-- |
-- 
-- Describes a block of an instant view web page
data PageBlock = 
 -- |
 -- 
 -- The title of a page 
 -- 
 -- __title__ Title
 PageBlockTitle { _title :: Maybe RichText.RichText }  |
 -- |
 -- 
 -- The subtitle of a page 
 -- 
 -- __subtitle__ Subtitle
 PageBlockSubtitle { subtitle :: Maybe RichText.RichText }  |
 -- |
 -- 
 -- The author and publishing date of a page 
 -- 
 -- __author__ Author
 -- 
 -- __publish_date__ Point in time (Unix timestamp) when the article was published; 0 if unknown
 PageBlockAuthorDate { publish_date :: Maybe Int, _author :: Maybe RichText.RichText }  |
 -- |
 -- 
 -- A header 
 -- 
 -- __header__ Header
 PageBlockHeader { header :: Maybe RichText.RichText }  |
 -- |
 -- 
 -- A subheader 
 -- 
 -- __subheader__ Subheader
 PageBlockSubheader { subheader :: Maybe RichText.RichText }  |
 -- |
 -- 
 -- A kicker 
 -- 
 -- __kicker__ Kicker
 PageBlockKicker { kicker :: Maybe RichText.RichText }  |
 -- |
 -- 
 -- A text paragraph 
 -- 
 -- __text__ Paragraph text
 PageBlockParagraph { text :: Maybe RichText.RichText }  |
 -- |
 -- 
 -- A preformatted text paragraph 
 -- 
 -- __text__ Paragraph text
 -- 
 -- __language__ Programming language for which the text needs to be formatted
 PageBlockPreformatted { language :: Maybe String, text :: Maybe RichText.RichText }  |
 -- |
 -- 
 -- The footer of a page 
 -- 
 -- __footer__ Footer
 PageBlockFooter { footer :: Maybe RichText.RichText }  |
 -- |
 -- 
 -- An empty block separating a page
 PageBlockDivider |
 -- |
 -- 
 -- An invisible anchor on a page, which can be used in a URL to open the page from the specified anchor 
 -- 
 -- __name__ Name of the anchor
 PageBlockAnchor { name :: Maybe String }  |
 -- |
 -- 
 -- A list of data blocks 
 -- 
 -- __items__ The items of the list
 PageBlockList { items :: Maybe [PageBlockListItem.PageBlockListItem] }  |
 -- |
 -- 
 -- A block quote 
 -- 
 -- __text__ Quote text
 -- 
 -- __credit__ Quote credit
 PageBlockBlockQuote { credit :: Maybe RichText.RichText, text :: Maybe RichText.RichText }  |
 -- |
 -- 
 -- A pull quote 
 -- 
 -- __text__ Quote text
 -- 
 -- __credit__ Quote credit
 PageBlockPullQuote { credit :: Maybe RichText.RichText, text :: Maybe RichText.RichText }  |
 -- |
 -- 
 -- An animation 
 -- 
 -- __animation__ Animation file; may be null
 -- 
 -- __caption__ Animation caption
 -- 
 -- __need_autoplay__ True, if the animation must be played automatically
 PageBlockAnimation { need_autoplay :: Maybe Bool, caption :: Maybe PageBlockCaption.PageBlockCaption, animation :: Maybe Animation.Animation }  |
 -- |
 -- 
 -- An audio file 
 -- 
 -- __audio__ Audio file; may be null
 -- 
 -- __caption__ Audio file caption
 PageBlockAudio { caption :: Maybe PageBlockCaption.PageBlockCaption, audio :: Maybe Audio.Audio }  |
 -- |
 -- 
 -- A photo 
 -- 
 -- __photo__ Photo file; may be null
 -- 
 -- __caption__ Photo caption
 -- 
 -- __url__ URL that needs to be opened when the photo is clicked
 PageBlockPhoto { url :: Maybe String, caption :: Maybe PageBlockCaption.PageBlockCaption, _photo :: Maybe Photo.Photo }  |
 -- |
 -- 
 -- A video 
 -- 
 -- __video__ Video file; may be null
 -- 
 -- __caption__ Video caption
 -- 
 -- __need_autoplay__ True, if the video must be played automatically
 -- 
 -- __is_looped__ True, if the video must be looped
 PageBlockVideo { is_looped :: Maybe Bool, need_autoplay :: Maybe Bool, caption :: Maybe PageBlockCaption.PageBlockCaption, video :: Maybe Video.Video }  |
 -- |
 -- 
 -- A voice note 
 -- 
 -- __voice_note__ Voice note; may be null
 -- 
 -- __caption__ Voice note caption
 PageBlockVoiceNote { caption :: Maybe PageBlockCaption.PageBlockCaption, voice_note :: Maybe VoiceNote.VoiceNote }  |
 -- |
 -- 
 -- A page cover 
 -- 
 -- __cover__ Cover
 PageBlockCover { cover :: Maybe PageBlock }  |
 -- |
 -- 
 -- An embedded web page 
 -- 
 -- __url__ Web page URL, if available
 -- 
 -- __html__ HTML-markup of the embedded page
 -- 
 -- __poster_photo__ Poster photo, if available; may be null
 -- 
 -- __width__ Block width; 0 if unknown
 -- 
 -- __height__ Block height; 0 if unknown
 -- 
 -- __caption__ Block caption
 -- 
 -- __is_full_width__ True, if the block must be full width
 -- 
 -- __allow_scrolling__ True, if scrolling needs to be allowed
 PageBlockEmbedded { allow_scrolling :: Maybe Bool, is_full_width :: Maybe Bool, caption :: Maybe PageBlockCaption.PageBlockCaption, height :: Maybe Int, width :: Maybe Int, poster_photo :: Maybe Photo.Photo, html :: Maybe String, url :: Maybe String }  |
 -- |
 -- 
 -- An embedded post 
 -- 
 -- __url__ Web page URL
 -- 
 -- __author__ Post author
 -- 
 -- __author_photo__ Post author photo; may be null
 -- 
 -- __date__ Point in time (Unix timestamp) when the post was created; 0 if unknown
 -- 
 -- __page_blocks__ Post content
 -- 
 -- __caption__ Post caption
 PageBlockEmbeddedPost { caption :: Maybe PageBlockCaption.PageBlockCaption, page_blocks :: Maybe [PageBlock], date :: Maybe Int, author_photo :: Maybe Photo.Photo, author :: Maybe String, url :: Maybe String }  |
 -- |
 -- 
 -- A collage 
 -- 
 -- __page_blocks__ Collage item contents
 -- 
 -- __caption__ Block caption
 PageBlockCollage { caption :: Maybe PageBlockCaption.PageBlockCaption, page_blocks :: Maybe [PageBlock] }  |
 -- |
 -- 
 -- A slideshow 
 -- 
 -- __page_blocks__ Slideshow item contents
 -- 
 -- __caption__ Block caption
 PageBlockSlideshow { caption :: Maybe PageBlockCaption.PageBlockCaption, page_blocks :: Maybe [PageBlock] }  |
 -- |
 -- 
 -- A link to a chat 
 -- 
 -- __title__ Chat title
 -- 
 -- __photo__ Chat photo; may be null
 -- 
 -- __username__ Chat username by which all other information about the chat can be resolved
 PageBlockChatLink { username :: Maybe String, photo :: Maybe ChatPhotoInfo.ChatPhotoInfo, title :: Maybe String }  |
 -- |
 -- 
 -- A table 
 -- 
 -- __caption__ Table caption
 -- 
 -- __cells__ Table cells
 -- 
 -- __is_bordered__ True, if the table is bordered
 -- 
 -- __is_striped__ True, if the table is striped
 PageBlockTable { is_striped :: Maybe Bool, is_bordered :: Maybe Bool, cells :: Maybe [PageBlockTableCell.PageBlockTableCell], _caption :: Maybe RichText.RichText }  |
 -- |
 -- 
 -- A collapsible block 
 -- 
 -- __header__ Always visible heading for the block
 -- 
 -- __page_blocks__ Block contents
 -- 
 -- __is_open__ True, if the block is open by default
 PageBlockDetails { is_open :: Maybe Bool, page_blocks :: Maybe [PageBlock], header :: Maybe RichText.RichText }  |
 -- |
 -- 
 -- Related articles 
 -- 
 -- __header__ Block header
 -- 
 -- __articles__ List of related articles
 PageBlockRelatedArticles { articles :: Maybe [PageBlockRelatedArticle.PageBlockRelatedArticle], header :: Maybe RichText.RichText }  |
 -- |
 -- 
 -- A map 
 -- 
 -- __location__ Location of the map center
 -- 
 -- __zoom__ Map zoom level
 -- 
 -- __width__ Map width
 -- 
 -- __height__ Map height
 -- 
 -- __caption__ Block caption
 PageBlockMap { caption :: Maybe PageBlockCaption.PageBlockCaption, height :: Maybe Int, width :: Maybe Int, zoom :: Maybe Int, location :: Maybe Location.Location }  deriving (Eq)

instance Show PageBlock where
 show PageBlockTitle { _title=_title } =
  "PageBlockTitle" ++ cc [p "_title" _title ]

 show PageBlockSubtitle { subtitle=subtitle } =
  "PageBlockSubtitle" ++ cc [p "subtitle" subtitle ]

 show PageBlockAuthorDate { publish_date=publish_date, _author=_author } =
  "PageBlockAuthorDate" ++ cc [p "publish_date" publish_date, p "_author" _author ]

 show PageBlockHeader { header=header } =
  "PageBlockHeader" ++ cc [p "header" header ]

 show PageBlockSubheader { subheader=subheader } =
  "PageBlockSubheader" ++ cc [p "subheader" subheader ]

 show PageBlockKicker { kicker=kicker } =
  "PageBlockKicker" ++ cc [p "kicker" kicker ]

 show PageBlockParagraph { text=text } =
  "PageBlockParagraph" ++ cc [p "text" text ]

 show PageBlockPreformatted { language=language, text=text } =
  "PageBlockPreformatted" ++ cc [p "language" language, p "text" text ]

 show PageBlockFooter { footer=footer } =
  "PageBlockFooter" ++ cc [p "footer" footer ]

 show PageBlockDivider {  } =
  "PageBlockDivider" ++ cc [ ]

 show PageBlockAnchor { name=name } =
  "PageBlockAnchor" ++ cc [p "name" name ]

 show PageBlockList { items=items } =
  "PageBlockList" ++ cc [p "items" items ]

 show PageBlockBlockQuote { credit=credit, text=text } =
  "PageBlockBlockQuote" ++ cc [p "credit" credit, p "text" text ]

 show PageBlockPullQuote { credit=credit, text=text } =
  "PageBlockPullQuote" ++ cc [p "credit" credit, p "text" text ]

 show PageBlockAnimation { need_autoplay=need_autoplay, caption=caption, animation=animation } =
  "PageBlockAnimation" ++ cc [p "need_autoplay" need_autoplay, p "caption" caption, p "animation" animation ]

 show PageBlockAudio { caption=caption, audio=audio } =
  "PageBlockAudio" ++ cc [p "caption" caption, p "audio" audio ]

 show PageBlockPhoto { url=url, caption=caption, _photo=_photo } =
  "PageBlockPhoto" ++ cc [p "url" url, p "caption" caption, p "_photo" _photo ]

 show PageBlockVideo { is_looped=is_looped, need_autoplay=need_autoplay, caption=caption, video=video } =
  "PageBlockVideo" ++ cc [p "is_looped" is_looped, p "need_autoplay" need_autoplay, p "caption" caption, p "video" video ]

 show PageBlockVoiceNote { caption=caption, voice_note=voice_note } =
  "PageBlockVoiceNote" ++ cc [p "caption" caption, p "voice_note" voice_note ]

 show PageBlockCover { cover=cover } =
  "PageBlockCover" ++ cc [p "cover" cover ]

 show PageBlockEmbedded { allow_scrolling=allow_scrolling, is_full_width=is_full_width, caption=caption, height=height, width=width, poster_photo=poster_photo, html=html, url=url } =
  "PageBlockEmbedded" ++ cc [p "allow_scrolling" allow_scrolling, p "is_full_width" is_full_width, p "caption" caption, p "height" height, p "width" width, p "poster_photo" poster_photo, p "html" html, p "url" url ]

 show PageBlockEmbeddedPost { caption=caption, page_blocks=page_blocks, date=date, author_photo=author_photo, author=author, url=url } =
  "PageBlockEmbeddedPost" ++ cc [p "caption" caption, p "page_blocks" page_blocks, p "date" date, p "author_photo" author_photo, p "author" author, p "url" url ]

 show PageBlockCollage { caption=caption, page_blocks=page_blocks } =
  "PageBlockCollage" ++ cc [p "caption" caption, p "page_blocks" page_blocks ]

 show PageBlockSlideshow { caption=caption, page_blocks=page_blocks } =
  "PageBlockSlideshow" ++ cc [p "caption" caption, p "page_blocks" page_blocks ]

 show PageBlockChatLink { username=username, photo=photo, title=title } =
  "PageBlockChatLink" ++ cc [p "username" username, p "photo" photo, p "title" title ]

 show PageBlockTable { is_striped=is_striped, is_bordered=is_bordered, cells=cells, _caption=_caption } =
  "PageBlockTable" ++ cc [p "is_striped" is_striped, p "is_bordered" is_bordered, p "cells" cells, p "_caption" _caption ]

 show PageBlockDetails { is_open=is_open, page_blocks=page_blocks, header=header } =
  "PageBlockDetails" ++ cc [p "is_open" is_open, p "page_blocks" page_blocks, p "header" header ]

 show PageBlockRelatedArticles { articles=articles, header=header } =
  "PageBlockRelatedArticles" ++ cc [p "articles" articles, p "header" header ]

 show PageBlockMap { caption=caption, height=height, width=width, zoom=zoom, location=location } =
  "PageBlockMap" ++ cc [p "caption" caption, p "height" height, p "width" width, p "zoom" zoom, p "location" location ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON PageBlock where
 toJSON PageBlockTitle { _title = _title } =
  A.object [ "@type" A..= T.String "pageBlockTitle", "title" A..= _title ]

 toJSON PageBlockSubtitle { subtitle = subtitle } =
  A.object [ "@type" A..= T.String "pageBlockSubtitle", "subtitle" A..= subtitle ]

 toJSON PageBlockAuthorDate { publish_date = publish_date, _author = _author } =
  A.object [ "@type" A..= T.String "pageBlockAuthorDate", "publish_date" A..= publish_date, "author" A..= _author ]

 toJSON PageBlockHeader { header = header } =
  A.object [ "@type" A..= T.String "pageBlockHeader", "header" A..= header ]

 toJSON PageBlockSubheader { subheader = subheader } =
  A.object [ "@type" A..= T.String "pageBlockSubheader", "subheader" A..= subheader ]

 toJSON PageBlockKicker { kicker = kicker } =
  A.object [ "@type" A..= T.String "pageBlockKicker", "kicker" A..= kicker ]

 toJSON PageBlockParagraph { text = text } =
  A.object [ "@type" A..= T.String "pageBlockParagraph", "text" A..= text ]

 toJSON PageBlockPreformatted { language = language, text = text } =
  A.object [ "@type" A..= T.String "pageBlockPreformatted", "language" A..= language, "text" A..= text ]

 toJSON PageBlockFooter { footer = footer } =
  A.object [ "@type" A..= T.String "pageBlockFooter", "footer" A..= footer ]

 toJSON PageBlockDivider {  } =
  A.object [ "@type" A..= T.String "pageBlockDivider" ]

 toJSON PageBlockAnchor { name = name } =
  A.object [ "@type" A..= T.String "pageBlockAnchor", "name" A..= name ]

 toJSON PageBlockList { items = items } =
  A.object [ "@type" A..= T.String "pageBlockList", "items" A..= items ]

 toJSON PageBlockBlockQuote { credit = credit, text = text } =
  A.object [ "@type" A..= T.String "pageBlockBlockQuote", "credit" A..= credit, "text" A..= text ]

 toJSON PageBlockPullQuote { credit = credit, text = text } =
  A.object [ "@type" A..= T.String "pageBlockPullQuote", "credit" A..= credit, "text" A..= text ]

 toJSON PageBlockAnimation { need_autoplay = need_autoplay, caption = caption, animation = animation } =
  A.object [ "@type" A..= T.String "pageBlockAnimation", "need_autoplay" A..= need_autoplay, "caption" A..= caption, "animation" A..= animation ]

 toJSON PageBlockAudio { caption = caption, audio = audio } =
  A.object [ "@type" A..= T.String "pageBlockAudio", "caption" A..= caption, "audio" A..= audio ]

 toJSON PageBlockPhoto { url = url, caption = caption, _photo = _photo } =
  A.object [ "@type" A..= T.String "pageBlockPhoto", "url" A..= url, "caption" A..= caption, "photo" A..= _photo ]

 toJSON PageBlockVideo { is_looped = is_looped, need_autoplay = need_autoplay, caption = caption, video = video } =
  A.object [ "@type" A..= T.String "pageBlockVideo", "is_looped" A..= is_looped, "need_autoplay" A..= need_autoplay, "caption" A..= caption, "video" A..= video ]

 toJSON PageBlockVoiceNote { caption = caption, voice_note = voice_note } =
  A.object [ "@type" A..= T.String "pageBlockVoiceNote", "caption" A..= caption, "voice_note" A..= voice_note ]

 toJSON PageBlockCover { cover = cover } =
  A.object [ "@type" A..= T.String "pageBlockCover", "cover" A..= cover ]

 toJSON PageBlockEmbedded { allow_scrolling = allow_scrolling, is_full_width = is_full_width, caption = caption, height = height, width = width, poster_photo = poster_photo, html = html, url = url } =
  A.object [ "@type" A..= T.String "pageBlockEmbedded", "allow_scrolling" A..= allow_scrolling, "is_full_width" A..= is_full_width, "caption" A..= caption, "height" A..= height, "width" A..= width, "poster_photo" A..= poster_photo, "html" A..= html, "url" A..= url ]

 toJSON PageBlockEmbeddedPost { caption = caption, page_blocks = page_blocks, date = date, author_photo = author_photo, author = author, url = url } =
  A.object [ "@type" A..= T.String "pageBlockEmbeddedPost", "caption" A..= caption, "page_blocks" A..= page_blocks, "date" A..= date, "author_photo" A..= author_photo, "author" A..= author, "url" A..= url ]

 toJSON PageBlockCollage { caption = caption, page_blocks = page_blocks } =
  A.object [ "@type" A..= T.String "pageBlockCollage", "caption" A..= caption, "page_blocks" A..= page_blocks ]

 toJSON PageBlockSlideshow { caption = caption, page_blocks = page_blocks } =
  A.object [ "@type" A..= T.String "pageBlockSlideshow", "caption" A..= caption, "page_blocks" A..= page_blocks ]

 toJSON PageBlockChatLink { username = username, photo = photo, title = title } =
  A.object [ "@type" A..= T.String "pageBlockChatLink", "username" A..= username, "photo" A..= photo, "title" A..= title ]

 toJSON PageBlockTable { is_striped = is_striped, is_bordered = is_bordered, cells = cells, _caption = _caption } =
  A.object [ "@type" A..= T.String "pageBlockTable", "is_striped" A..= is_striped, "is_bordered" A..= is_bordered, "cells" A..= cells, "caption" A..= _caption ]

 toJSON PageBlockDetails { is_open = is_open, page_blocks = page_blocks, header = header } =
  A.object [ "@type" A..= T.String "pageBlockDetails", "is_open" A..= is_open, "page_blocks" A..= page_blocks, "header" A..= header ]

 toJSON PageBlockRelatedArticles { articles = articles, header = header } =
  A.object [ "@type" A..= T.String "pageBlockRelatedArticles", "articles" A..= articles, "header" A..= header ]

 toJSON PageBlockMap { caption = caption, height = height, width = width, zoom = zoom, location = location } =
  A.object [ "@type" A..= T.String "pageBlockMap", "caption" A..= caption, "height" A..= height, "width" A..= width, "zoom" A..= zoom, "location" A..= location ]

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
    _title <- o A..:? "title"
    return $ PageBlockTitle { _title = _title }

   parsePageBlockSubtitle :: A.Value -> T.Parser PageBlock
   parsePageBlockSubtitle = A.withObject "PageBlockSubtitle" $ \o -> do
    subtitle <- o A..:? "subtitle"
    return $ PageBlockSubtitle { subtitle = subtitle }

   parsePageBlockAuthorDate :: A.Value -> T.Parser PageBlock
   parsePageBlockAuthorDate = A.withObject "PageBlockAuthorDate" $ \o -> do
    publish_date <- mconcat [ o A..:? "publish_date", readMaybe <$> (o A..: "publish_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    _author <- o A..:? "author"
    return $ PageBlockAuthorDate { publish_date = publish_date, _author = _author }

   parsePageBlockHeader :: A.Value -> T.Parser PageBlock
   parsePageBlockHeader = A.withObject "PageBlockHeader" $ \o -> do
    header <- o A..:? "header"
    return $ PageBlockHeader { header = header }

   parsePageBlockSubheader :: A.Value -> T.Parser PageBlock
   parsePageBlockSubheader = A.withObject "PageBlockSubheader" $ \o -> do
    subheader <- o A..:? "subheader"
    return $ PageBlockSubheader { subheader = subheader }

   parsePageBlockKicker :: A.Value -> T.Parser PageBlock
   parsePageBlockKicker = A.withObject "PageBlockKicker" $ \o -> do
    kicker <- o A..:? "kicker"
    return $ PageBlockKicker { kicker = kicker }

   parsePageBlockParagraph :: A.Value -> T.Parser PageBlock
   parsePageBlockParagraph = A.withObject "PageBlockParagraph" $ \o -> do
    text <- o A..:? "text"
    return $ PageBlockParagraph { text = text }

   parsePageBlockPreformatted :: A.Value -> T.Parser PageBlock
   parsePageBlockPreformatted = A.withObject "PageBlockPreformatted" $ \o -> do
    language <- o A..:? "language"
    text <- o A..:? "text"
    return $ PageBlockPreformatted { language = language, text = text }

   parsePageBlockFooter :: A.Value -> T.Parser PageBlock
   parsePageBlockFooter = A.withObject "PageBlockFooter" $ \o -> do
    footer <- o A..:? "footer"
    return $ PageBlockFooter { footer = footer }

   parsePageBlockDivider :: A.Value -> T.Parser PageBlock
   parsePageBlockDivider = A.withObject "PageBlockDivider" $ \o -> do
    return $ PageBlockDivider {  }

   parsePageBlockAnchor :: A.Value -> T.Parser PageBlock
   parsePageBlockAnchor = A.withObject "PageBlockAnchor" $ \o -> do
    name <- o A..:? "name"
    return $ PageBlockAnchor { name = name }

   parsePageBlockList :: A.Value -> T.Parser PageBlock
   parsePageBlockList = A.withObject "PageBlockList" $ \o -> do
    items <- o A..:? "items"
    return $ PageBlockList { items = items }

   parsePageBlockBlockQuote :: A.Value -> T.Parser PageBlock
   parsePageBlockBlockQuote = A.withObject "PageBlockBlockQuote" $ \o -> do
    credit <- o A..:? "credit"
    text <- o A..:? "text"
    return $ PageBlockBlockQuote { credit = credit, text = text }

   parsePageBlockPullQuote :: A.Value -> T.Parser PageBlock
   parsePageBlockPullQuote = A.withObject "PageBlockPullQuote" $ \o -> do
    credit <- o A..:? "credit"
    text <- o A..:? "text"
    return $ PageBlockPullQuote { credit = credit, text = text }

   parsePageBlockAnimation :: A.Value -> T.Parser PageBlock
   parsePageBlockAnimation = A.withObject "PageBlockAnimation" $ \o -> do
    need_autoplay <- o A..:? "need_autoplay"
    caption <- o A..:? "caption"
    animation <- o A..:? "animation"
    return $ PageBlockAnimation { need_autoplay = need_autoplay, caption = caption, animation = animation }

   parsePageBlockAudio :: A.Value -> T.Parser PageBlock
   parsePageBlockAudio = A.withObject "PageBlockAudio" $ \o -> do
    caption <- o A..:? "caption"
    audio <- o A..:? "audio"
    return $ PageBlockAudio { caption = caption, audio = audio }

   parsePageBlockPhoto :: A.Value -> T.Parser PageBlock
   parsePageBlockPhoto = A.withObject "PageBlockPhoto" $ \o -> do
    url <- o A..:? "url"
    caption <- o A..:? "caption"
    _photo <- o A..:? "photo"
    return $ PageBlockPhoto { url = url, caption = caption, _photo = _photo }

   parsePageBlockVideo :: A.Value -> T.Parser PageBlock
   parsePageBlockVideo = A.withObject "PageBlockVideo" $ \o -> do
    is_looped <- o A..:? "is_looped"
    need_autoplay <- o A..:? "need_autoplay"
    caption <- o A..:? "caption"
    video <- o A..:? "video"
    return $ PageBlockVideo { is_looped = is_looped, need_autoplay = need_autoplay, caption = caption, video = video }

   parsePageBlockVoiceNote :: A.Value -> T.Parser PageBlock
   parsePageBlockVoiceNote = A.withObject "PageBlockVoiceNote" $ \o -> do
    caption <- o A..:? "caption"
    voice_note <- o A..:? "voice_note"
    return $ PageBlockVoiceNote { caption = caption, voice_note = voice_note }

   parsePageBlockCover :: A.Value -> T.Parser PageBlock
   parsePageBlockCover = A.withObject "PageBlockCover" $ \o -> do
    cover <- o A..:? "cover"
    return $ PageBlockCover { cover = cover }

   parsePageBlockEmbedded :: A.Value -> T.Parser PageBlock
   parsePageBlockEmbedded = A.withObject "PageBlockEmbedded" $ \o -> do
    allow_scrolling <- o A..:? "allow_scrolling"
    is_full_width <- o A..:? "is_full_width"
    caption <- o A..:? "caption"
    height <- mconcat [ o A..:? "height", readMaybe <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
    width <- mconcat [ o A..:? "width", readMaybe <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
    poster_photo <- o A..:? "poster_photo"
    html <- o A..:? "html"
    url <- o A..:? "url"
    return $ PageBlockEmbedded { allow_scrolling = allow_scrolling, is_full_width = is_full_width, caption = caption, height = height, width = width, poster_photo = poster_photo, html = html, url = url }

   parsePageBlockEmbeddedPost :: A.Value -> T.Parser PageBlock
   parsePageBlockEmbeddedPost = A.withObject "PageBlockEmbeddedPost" $ \o -> do
    caption <- o A..:? "caption"
    page_blocks <- o A..:? "page_blocks"
    date <- mconcat [ o A..:? "date", readMaybe <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
    author_photo <- o A..:? "author_photo"
    author <- o A..:? "author"
    url <- o A..:? "url"
    return $ PageBlockEmbeddedPost { caption = caption, page_blocks = page_blocks, date = date, author_photo = author_photo, author = author, url = url }

   parsePageBlockCollage :: A.Value -> T.Parser PageBlock
   parsePageBlockCollage = A.withObject "PageBlockCollage" $ \o -> do
    caption <- o A..:? "caption"
    page_blocks <- o A..:? "page_blocks"
    return $ PageBlockCollage { caption = caption, page_blocks = page_blocks }

   parsePageBlockSlideshow :: A.Value -> T.Parser PageBlock
   parsePageBlockSlideshow = A.withObject "PageBlockSlideshow" $ \o -> do
    caption <- o A..:? "caption"
    page_blocks <- o A..:? "page_blocks"
    return $ PageBlockSlideshow { caption = caption, page_blocks = page_blocks }

   parsePageBlockChatLink :: A.Value -> T.Parser PageBlock
   parsePageBlockChatLink = A.withObject "PageBlockChatLink" $ \o -> do
    username <- o A..:? "username"
    photo <- o A..:? "photo"
    title <- o A..:? "title"
    return $ PageBlockChatLink { username = username, photo = photo, title = title }

   parsePageBlockTable :: A.Value -> T.Parser PageBlock
   parsePageBlockTable = A.withObject "PageBlockTable" $ \o -> do
    is_striped <- o A..:? "is_striped"
    is_bordered <- o A..:? "is_bordered"
    cells <- o A..:? "cells"
    _caption <- o A..:? "caption"
    return $ PageBlockTable { is_striped = is_striped, is_bordered = is_bordered, cells = cells, _caption = _caption }

   parsePageBlockDetails :: A.Value -> T.Parser PageBlock
   parsePageBlockDetails = A.withObject "PageBlockDetails" $ \o -> do
    is_open <- o A..:? "is_open"
    page_blocks <- o A..:? "page_blocks"
    header <- o A..:? "header"
    return $ PageBlockDetails { is_open = is_open, page_blocks = page_blocks, header = header }

   parsePageBlockRelatedArticles :: A.Value -> T.Parser PageBlock
   parsePageBlockRelatedArticles = A.withObject "PageBlockRelatedArticles" $ \o -> do
    articles <- o A..:? "articles"
    header <- o A..:? "header"
    return $ PageBlockRelatedArticles { articles = articles, header = header }

   parsePageBlockMap :: A.Value -> T.Parser PageBlock
   parsePageBlockMap = A.withObject "PageBlockMap" $ \o -> do
    caption <- o A..:? "caption"
    height <- mconcat [ o A..:? "height", readMaybe <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
    width <- mconcat [ o A..:? "width", readMaybe <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
    zoom <- mconcat [ o A..:? "zoom", readMaybe <$> (o A..: "zoom" :: T.Parser String)] :: T.Parser (Maybe Int)
    location <- o A..:? "location"
    return $ PageBlockMap { caption = caption, height = height, width = width, zoom = zoom, location = location }
 parseJSON _ = mempty
