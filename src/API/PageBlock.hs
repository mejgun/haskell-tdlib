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

--main = putStrLn "ok"

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
 | PageBlockMap { caption :: PageBlockCaption.PageBlockCaption, height :: Int, width :: Int, zoom :: Int, location :: Location.Location }  -- deriving (Show)

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
-- pageBlockTitle PageBlock  { _title :: RichText.RichText } 

-- pageBlockSubtitle PageBlock  { subtitle :: RichText.RichText } 

-- pageBlockAuthorDate PageBlock  { publish_date :: Int, _author :: RichText.RichText } 

-- pageBlockHeader PageBlock  { header :: RichText.RichText } 

-- pageBlockSubheader PageBlock  { subheader :: RichText.RichText } 

-- pageBlockKicker PageBlock  { kicker :: RichText.RichText } 

-- pageBlockParagraph PageBlock  { text :: RichText.RichText } 

-- pageBlockPreformatted PageBlock  { language :: String, text :: RichText.RichText } 

-- pageBlockFooter PageBlock  { footer :: RichText.RichText } 

-- pageBlockDivider PageBlock 

-- pageBlockAnchor PageBlock  { name :: String } 

-- pageBlockList PageBlock  { items :: [PageBlockListItem.PageBlockListItem] } 

-- pageBlockBlockQuote PageBlock  { credit :: RichText.RichText, text :: RichText.RichText } 

-- pageBlockPullQuote PageBlock  { credit :: RichText.RichText, text :: RichText.RichText } 

-- pageBlockAnimation PageBlock  { need_autoplay :: Bool, caption :: PageBlockCaption.PageBlockCaption, animation :: Animation.Animation } 

-- pageBlockAudio PageBlock  { caption :: PageBlockCaption.PageBlockCaption, audio :: Audio.Audio } 

-- pageBlockPhoto PageBlock  { url :: String, caption :: PageBlockCaption.PageBlockCaption, _photo :: Photo.Photo } 

-- pageBlockVideo PageBlock  { is_looped :: Bool, need_autoplay :: Bool, caption :: PageBlockCaption.PageBlockCaption, video :: Video.Video } 

-- pageBlockVoiceNote PageBlock  { caption :: PageBlockCaption.PageBlockCaption, voice_note :: VoiceNote.VoiceNote } 

-- pageBlockCover PageBlock  { cover :: PageBlock } 

-- pageBlockEmbedded PageBlock  { allow_scrolling :: Bool, is_full_width :: Bool, caption :: PageBlockCaption.PageBlockCaption, height :: Int, width :: Int, poster_photo :: Photo.Photo, html :: String, url :: String } 

-- pageBlockEmbeddedPost PageBlock  { caption :: PageBlockCaption.PageBlockCaption, page_blocks :: [PageBlock], date :: Int, author_photo :: Photo.Photo, author :: String, url :: String } 

-- pageBlockCollage PageBlock  { caption :: PageBlockCaption.PageBlockCaption, page_blocks :: [PageBlock] } 

-- pageBlockSlideshow PageBlock  { caption :: PageBlockCaption.PageBlockCaption, page_blocks :: [PageBlock] } 

-- pageBlockChatLink PageBlock  { username :: String, photo :: ChatPhoto.ChatPhoto, title :: String } 

-- pageBlockTable PageBlock  { is_striped :: Bool, is_bordered :: Bool, cells :: [PageBlockTableCell.PageBlockTableCell], _caption :: RichText.RichText } 

-- pageBlockDetails PageBlock  { is_open :: Bool, page_blocks :: [PageBlock], header :: RichText.RichText } 

-- pageBlockRelatedArticles PageBlock  { articles :: [PageBlockRelatedArticle.PageBlockRelatedArticle], header :: RichText.RichText } 

-- pageBlockMap PageBlock  { caption :: PageBlockCaption.PageBlockCaption, height :: Int, width :: Int, zoom :: Int, location :: Location.Location } 

