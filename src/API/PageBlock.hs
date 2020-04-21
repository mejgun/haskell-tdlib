-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PageBlock where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PageBlockListItem as PageBlockListItem
import {-# SOURCE #-} qualified API.Animation as Animation
import {-# SOURCE #-} qualified API.Audio as Audio
import {-# SOURCE #-} qualified API.Video as Video
import {-# SOURCE #-} qualified API.VoiceNote as VoiceNote
import {-# SOURCE #-} qualified API.Photo as Photo
import {-# SOURCE #-} qualified API.ChatPhoto as ChatPhoto
import {-# SOURCE #-} qualified API.PageBlockTableCell as PageBlockTableCell
import {-# SOURCE #-} qualified API.PageBlockRelatedArticle as PageBlockRelatedArticle
import {-# SOURCE #-} qualified API.RichText as RichText
import {-# SOURCE #-} qualified API.PageBlockCaption as PageBlockCaption
import {-# SOURCE #-} qualified API.Location as Location

data PageBlock = 
 PageBlockTitle { _title :: RichText.RichText }  
 | PageBlockSubtitle { subtitle :: RichText.RichText }  
 | PageBlockAuthorDate { publish_date :: Int, _author :: RichText.RichText }  
 | PageBlockHeader { header :: RichText.RichText }  
 | PageBlockSubheader { subheader :: RichText.RichText }  
 | PageBlockKicker { kicker :: RichText.RichText }  
 | PageBlockParagraph { text :: RichText.RichText }  
 | PageBlockPreformatted { language :: String, text :: RichText.RichText }  
 | PageBlockFooter { footer :: RichText.RichText }  
 | PageBlockDivider 
 | PageBlockAnchor { name :: String }  
 | PageBlockList { items :: [PageBlockListItem.PageBlockListItem] }  
 | PageBlockBlockQuote { credit :: RichText.RichText, text :: RichText.RichText }  
 | PageBlockPullQuote { credit :: RichText.RichText, text :: RichText.RichText }  
 | PageBlockAnimation { need_autoplay :: Bool, caption :: PageBlockCaption.PageBlockCaption, animation :: Animation.Animation }  
 | PageBlockAudio { caption :: PageBlockCaption.PageBlockCaption, audio :: Audio.Audio }  
 | PageBlockPhoto { url :: String, caption :: PageBlockCaption.PageBlockCaption, _photo :: Photo.Photo }  
 | PageBlockVideo { is_looped :: Bool, need_autoplay :: Bool, caption :: PageBlockCaption.PageBlockCaption, video :: Video.Video }  
 | PageBlockVoiceNote { caption :: PageBlockCaption.PageBlockCaption, voice_note :: VoiceNote.VoiceNote }  
 | PageBlockCover { cover :: PageBlock }  
 | PageBlockEmbedded { allow_scrolling :: Bool, is_full_width :: Bool, caption :: PageBlockCaption.PageBlockCaption, height :: Int, width :: Int, poster_photo :: Photo.Photo, html :: String, url :: String }  
 | PageBlockEmbeddedPost { caption :: PageBlockCaption.PageBlockCaption, page_blocks :: [PageBlock], date :: Int, author_photo :: Photo.Photo, author :: String, url :: String }  
 | PageBlockCollage { caption :: PageBlockCaption.PageBlockCaption, page_blocks :: [PageBlock] }  
 | PageBlockSlideshow { caption :: PageBlockCaption.PageBlockCaption, page_blocks :: [PageBlock] }  
 | PageBlockChatLink { username :: String, photo :: ChatPhoto.ChatPhoto, title :: String }  
 | PageBlockTable { is_striped :: Bool, is_bordered :: Bool, cells :: [PageBlockTableCell.PageBlockTableCell], _caption :: RichText.RichText }  
 | PageBlockDetails { is_open :: Bool, page_blocks :: [PageBlock], header :: RichText.RichText }  
 | PageBlockRelatedArticles { articles :: [PageBlockRelatedArticle.PageBlockRelatedArticle], header :: RichText.RichText }  
 | PageBlockMap { caption :: PageBlockCaption.PageBlockCaption, height :: Int, width :: Int, zoom :: Int, location :: Location.Location }  deriving (Show)

instance T.ToJSON PageBlock where
 toJSON (PageBlockTitle { _title = _title }) =
  A.object [ "@type" A..= T.String "pageBlockTitle", "title" A..= _title ]

 toJSON (PageBlockSubtitle { subtitle = subtitle }) =
  A.object [ "@type" A..= T.String "pageBlockSubtitle", "subtitle" A..= subtitle ]

 toJSON (PageBlockAuthorDate { publish_date = publish_date, _author = _author }) =
  A.object [ "@type" A..= T.String "pageBlockAuthorDate", "publish_date" A..= publish_date, "author" A..= _author ]

 toJSON (PageBlockHeader { header = header }) =
  A.object [ "@type" A..= T.String "pageBlockHeader", "header" A..= header ]

 toJSON (PageBlockSubheader { subheader = subheader }) =
  A.object [ "@type" A..= T.String "pageBlockSubheader", "subheader" A..= subheader ]

 toJSON (PageBlockKicker { kicker = kicker }) =
  A.object [ "@type" A..= T.String "pageBlockKicker", "kicker" A..= kicker ]

 toJSON (PageBlockParagraph { text = text }) =
  A.object [ "@type" A..= T.String "pageBlockParagraph", "text" A..= text ]

 toJSON (PageBlockPreformatted { language = language, text = text }) =
  A.object [ "@type" A..= T.String "pageBlockPreformatted", "language" A..= language, "text" A..= text ]

 toJSON (PageBlockFooter { footer = footer }) =
  A.object [ "@type" A..= T.String "pageBlockFooter", "footer" A..= footer ]

 toJSON (PageBlockDivider {  }) =
  A.object [ "@type" A..= T.String "pageBlockDivider" ]

 toJSON (PageBlockAnchor { name = name }) =
  A.object [ "@type" A..= T.String "pageBlockAnchor", "name" A..= name ]

 toJSON (PageBlockList { items = items }) =
  A.object [ "@type" A..= T.String "pageBlockList", "items" A..= items ]

 toJSON (PageBlockBlockQuote { credit = credit, text = text }) =
  A.object [ "@type" A..= T.String "pageBlockBlockQuote", "credit" A..= credit, "text" A..= text ]

 toJSON (PageBlockPullQuote { credit = credit, text = text }) =
  A.object [ "@type" A..= T.String "pageBlockPullQuote", "credit" A..= credit, "text" A..= text ]

 toJSON (PageBlockAnimation { need_autoplay = need_autoplay, caption = caption, animation = animation }) =
  A.object [ "@type" A..= T.String "pageBlockAnimation", "need_autoplay" A..= need_autoplay, "caption" A..= caption, "animation" A..= animation ]

 toJSON (PageBlockAudio { caption = caption, audio = audio }) =
  A.object [ "@type" A..= T.String "pageBlockAudio", "caption" A..= caption, "audio" A..= audio ]

 toJSON (PageBlockPhoto { url = url, caption = caption, _photo = _photo }) =
  A.object [ "@type" A..= T.String "pageBlockPhoto", "url" A..= url, "caption" A..= caption, "photo" A..= _photo ]

 toJSON (PageBlockVideo { is_looped = is_looped, need_autoplay = need_autoplay, caption = caption, video = video }) =
  A.object [ "@type" A..= T.String "pageBlockVideo", "is_looped" A..= is_looped, "need_autoplay" A..= need_autoplay, "caption" A..= caption, "video" A..= video ]

 toJSON (PageBlockVoiceNote { caption = caption, voice_note = voice_note }) =
  A.object [ "@type" A..= T.String "pageBlockVoiceNote", "caption" A..= caption, "voice_note" A..= voice_note ]

 toJSON (PageBlockCover { cover = cover }) =
  A.object [ "@type" A..= T.String "pageBlockCover", "cover" A..= cover ]

 toJSON (PageBlockEmbedded { allow_scrolling = allow_scrolling, is_full_width = is_full_width, caption = caption, height = height, width = width, poster_photo = poster_photo, html = html, url = url }) =
  A.object [ "@type" A..= T.String "pageBlockEmbedded", "allow_scrolling" A..= allow_scrolling, "is_full_width" A..= is_full_width, "caption" A..= caption, "height" A..= height, "width" A..= width, "poster_photo" A..= poster_photo, "html" A..= html, "url" A..= url ]

 toJSON (PageBlockEmbeddedPost { caption = caption, page_blocks = page_blocks, date = date, author_photo = author_photo, author = author, url = url }) =
  A.object [ "@type" A..= T.String "pageBlockEmbeddedPost", "caption" A..= caption, "page_blocks" A..= page_blocks, "date" A..= date, "author_photo" A..= author_photo, "author" A..= author, "url" A..= url ]

 toJSON (PageBlockCollage { caption = caption, page_blocks = page_blocks }) =
  A.object [ "@type" A..= T.String "pageBlockCollage", "caption" A..= caption, "page_blocks" A..= page_blocks ]

 toJSON (PageBlockSlideshow { caption = caption, page_blocks = page_blocks }) =
  A.object [ "@type" A..= T.String "pageBlockSlideshow", "caption" A..= caption, "page_blocks" A..= page_blocks ]

 toJSON (PageBlockChatLink { username = username, photo = photo, title = title }) =
  A.object [ "@type" A..= T.String "pageBlockChatLink", "username" A..= username, "photo" A..= photo, "title" A..= title ]

 toJSON (PageBlockTable { is_striped = is_striped, is_bordered = is_bordered, cells = cells, _caption = _caption }) =
  A.object [ "@type" A..= T.String "pageBlockTable", "is_striped" A..= is_striped, "is_bordered" A..= is_bordered, "cells" A..= cells, "caption" A..= _caption ]

 toJSON (PageBlockDetails { is_open = is_open, page_blocks = page_blocks, header = header }) =
  A.object [ "@type" A..= T.String "pageBlockDetails", "is_open" A..= is_open, "page_blocks" A..= page_blocks, "header" A..= header ]

 toJSON (PageBlockRelatedArticles { articles = articles, header = header }) =
  A.object [ "@type" A..= T.String "pageBlockRelatedArticles", "articles" A..= articles, "header" A..= header ]

 toJSON (PageBlockMap { caption = caption, height = height, width = width, zoom = zoom, location = location }) =
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
    _title <- o A..: "title"
    return $ PageBlockTitle { _title = _title }

   parsePageBlockSubtitle :: A.Value -> T.Parser PageBlock
   parsePageBlockSubtitle = A.withObject "PageBlockSubtitle" $ \o -> do
    subtitle <- o A..: "subtitle"
    return $ PageBlockSubtitle { subtitle = subtitle }

   parsePageBlockAuthorDate :: A.Value -> T.Parser PageBlock
   parsePageBlockAuthorDate = A.withObject "PageBlockAuthorDate" $ \o -> do
    publish_date <- o A..: "publish_date"
    _author <- o A..: "author"
    return $ PageBlockAuthorDate { publish_date = publish_date, _author = _author }

   parsePageBlockHeader :: A.Value -> T.Parser PageBlock
   parsePageBlockHeader = A.withObject "PageBlockHeader" $ \o -> do
    header <- o A..: "header"
    return $ PageBlockHeader { header = header }

   parsePageBlockSubheader :: A.Value -> T.Parser PageBlock
   parsePageBlockSubheader = A.withObject "PageBlockSubheader" $ \o -> do
    subheader <- o A..: "subheader"
    return $ PageBlockSubheader { subheader = subheader }

   parsePageBlockKicker :: A.Value -> T.Parser PageBlock
   parsePageBlockKicker = A.withObject "PageBlockKicker" $ \o -> do
    kicker <- o A..: "kicker"
    return $ PageBlockKicker { kicker = kicker }

   parsePageBlockParagraph :: A.Value -> T.Parser PageBlock
   parsePageBlockParagraph = A.withObject "PageBlockParagraph" $ \o -> do
    text <- o A..: "text"
    return $ PageBlockParagraph { text = text }

   parsePageBlockPreformatted :: A.Value -> T.Parser PageBlock
   parsePageBlockPreformatted = A.withObject "PageBlockPreformatted" $ \o -> do
    language <- o A..: "language"
    text <- o A..: "text"
    return $ PageBlockPreformatted { language = language, text = text }

   parsePageBlockFooter :: A.Value -> T.Parser PageBlock
   parsePageBlockFooter = A.withObject "PageBlockFooter" $ \o -> do
    footer <- o A..: "footer"
    return $ PageBlockFooter { footer = footer }

   parsePageBlockDivider :: A.Value -> T.Parser PageBlock
   parsePageBlockDivider = A.withObject "PageBlockDivider" $ \o -> do
    return $ PageBlockDivider {  }

   parsePageBlockAnchor :: A.Value -> T.Parser PageBlock
   parsePageBlockAnchor = A.withObject "PageBlockAnchor" $ \o -> do
    name <- o A..: "name"
    return $ PageBlockAnchor { name = name }

   parsePageBlockList :: A.Value -> T.Parser PageBlock
   parsePageBlockList = A.withObject "PageBlockList" $ \o -> do
    items <- o A..: "items"
    return $ PageBlockList { items = items }

   parsePageBlockBlockQuote :: A.Value -> T.Parser PageBlock
   parsePageBlockBlockQuote = A.withObject "PageBlockBlockQuote" $ \o -> do
    credit <- o A..: "credit"
    text <- o A..: "text"
    return $ PageBlockBlockQuote { credit = credit, text = text }

   parsePageBlockPullQuote :: A.Value -> T.Parser PageBlock
   parsePageBlockPullQuote = A.withObject "PageBlockPullQuote" $ \o -> do
    credit <- o A..: "credit"
    text <- o A..: "text"
    return $ PageBlockPullQuote { credit = credit, text = text }

   parsePageBlockAnimation :: A.Value -> T.Parser PageBlock
   parsePageBlockAnimation = A.withObject "PageBlockAnimation" $ \o -> do
    need_autoplay <- o A..: "need_autoplay"
    caption <- o A..: "caption"
    animation <- o A..: "animation"
    return $ PageBlockAnimation { need_autoplay = need_autoplay, caption = caption, animation = animation }

   parsePageBlockAudio :: A.Value -> T.Parser PageBlock
   parsePageBlockAudio = A.withObject "PageBlockAudio" $ \o -> do
    caption <- o A..: "caption"
    audio <- o A..: "audio"
    return $ PageBlockAudio { caption = caption, audio = audio }

   parsePageBlockPhoto :: A.Value -> T.Parser PageBlock
   parsePageBlockPhoto = A.withObject "PageBlockPhoto" $ \o -> do
    url <- o A..: "url"
    caption <- o A..: "caption"
    _photo <- o A..: "photo"
    return $ PageBlockPhoto { url = url, caption = caption, _photo = _photo }

   parsePageBlockVideo :: A.Value -> T.Parser PageBlock
   parsePageBlockVideo = A.withObject "PageBlockVideo" $ \o -> do
    is_looped <- o A..: "is_looped"
    need_autoplay <- o A..: "need_autoplay"
    caption <- o A..: "caption"
    video <- o A..: "video"
    return $ PageBlockVideo { is_looped = is_looped, need_autoplay = need_autoplay, caption = caption, video = video }

   parsePageBlockVoiceNote :: A.Value -> T.Parser PageBlock
   parsePageBlockVoiceNote = A.withObject "PageBlockVoiceNote" $ \o -> do
    caption <- o A..: "caption"
    voice_note <- o A..: "voice_note"
    return $ PageBlockVoiceNote { caption = caption, voice_note = voice_note }

   parsePageBlockCover :: A.Value -> T.Parser PageBlock
   parsePageBlockCover = A.withObject "PageBlockCover" $ \o -> do
    cover <- o A..: "cover"
    return $ PageBlockCover { cover = cover }

   parsePageBlockEmbedded :: A.Value -> T.Parser PageBlock
   parsePageBlockEmbedded = A.withObject "PageBlockEmbedded" $ \o -> do
    allow_scrolling <- o A..: "allow_scrolling"
    is_full_width <- o A..: "is_full_width"
    caption <- o A..: "caption"
    height <- o A..: "height"
    width <- o A..: "width"
    poster_photo <- o A..: "poster_photo"
    html <- o A..: "html"
    url <- o A..: "url"
    return $ PageBlockEmbedded { allow_scrolling = allow_scrolling, is_full_width = is_full_width, caption = caption, height = height, width = width, poster_photo = poster_photo, html = html, url = url }

   parsePageBlockEmbeddedPost :: A.Value -> T.Parser PageBlock
   parsePageBlockEmbeddedPost = A.withObject "PageBlockEmbeddedPost" $ \o -> do
    caption <- o A..: "caption"
    page_blocks <- o A..: "page_blocks"
    date <- o A..: "date"
    author_photo <- o A..: "author_photo"
    author <- o A..: "author"
    url <- o A..: "url"
    return $ PageBlockEmbeddedPost { caption = caption, page_blocks = page_blocks, date = date, author_photo = author_photo, author = author, url = url }

   parsePageBlockCollage :: A.Value -> T.Parser PageBlock
   parsePageBlockCollage = A.withObject "PageBlockCollage" $ \o -> do
    caption <- o A..: "caption"
    page_blocks <- o A..: "page_blocks"
    return $ PageBlockCollage { caption = caption, page_blocks = page_blocks }

   parsePageBlockSlideshow :: A.Value -> T.Parser PageBlock
   parsePageBlockSlideshow = A.withObject "PageBlockSlideshow" $ \o -> do
    caption <- o A..: "caption"
    page_blocks <- o A..: "page_blocks"
    return $ PageBlockSlideshow { caption = caption, page_blocks = page_blocks }

   parsePageBlockChatLink :: A.Value -> T.Parser PageBlock
   parsePageBlockChatLink = A.withObject "PageBlockChatLink" $ \o -> do
    username <- o A..: "username"
    photo <- o A..: "photo"
    title <- o A..: "title"
    return $ PageBlockChatLink { username = username, photo = photo, title = title }

   parsePageBlockTable :: A.Value -> T.Parser PageBlock
   parsePageBlockTable = A.withObject "PageBlockTable" $ \o -> do
    is_striped <- o A..: "is_striped"
    is_bordered <- o A..: "is_bordered"
    cells <- o A..: "cells"
    _caption <- o A..: "caption"
    return $ PageBlockTable { is_striped = is_striped, is_bordered = is_bordered, cells = cells, _caption = _caption }

   parsePageBlockDetails :: A.Value -> T.Parser PageBlock
   parsePageBlockDetails = A.withObject "PageBlockDetails" $ \o -> do
    is_open <- o A..: "is_open"
    page_blocks <- o A..: "page_blocks"
    header <- o A..: "header"
    return $ PageBlockDetails { is_open = is_open, page_blocks = page_blocks, header = header }

   parsePageBlockRelatedArticles :: A.Value -> T.Parser PageBlock
   parsePageBlockRelatedArticles = A.withObject "PageBlockRelatedArticles" $ \o -> do
    articles <- o A..: "articles"
    header <- o A..: "header"
    return $ PageBlockRelatedArticles { articles = articles, header = header }

   parsePageBlockMap :: A.Value -> T.Parser PageBlock
   parsePageBlockMap = A.withObject "PageBlockMap" $ \o -> do
    caption <- o A..: "caption"
    height <- o A..: "height"
    width <- o A..: "width"
    zoom <- o A..: "zoom"
    location <- o A..: "location"
    return $ PageBlockMap { caption = caption, height = height, width = width, zoom = zoom, location = location }