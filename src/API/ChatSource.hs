-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatSource where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Describes a reason why an external chat is shown in a chat list
data ChatSource = 
 -- |
 -- 
 -- The chat is sponsored by the user's MTProxy server
 ChatSourceMtprotoProxy |
 -- |
 -- 
 -- The chat contains a public service announcement 
 -- 
 -- __type__ The type of the announcement
 -- 
 -- __text__ The text of the announcement
 ChatSourcePublicServiceAnnouncement { text :: Maybe String, _type :: Maybe String }  deriving (Eq)

instance Show ChatSource where
 show ChatSourceMtprotoProxy {  } =
  "ChatSourceMtprotoProxy" ++ U.cc [ ]

 show ChatSourcePublicServiceAnnouncement { text=text, _type=_type } =
  "ChatSourcePublicServiceAnnouncement" ++ U.cc [U.p "text" text, U.p "_type" _type ]

instance T.ToJSON ChatSource where
 toJSON ChatSourceMtprotoProxy {  } =
  A.object [ "@type" A..= T.String "chatSourceMtprotoProxy" ]

 toJSON ChatSourcePublicServiceAnnouncement { text = text, _type = _type } =
  A.object [ "@type" A..= T.String "chatSourcePublicServiceAnnouncement", "text" A..= text, "type" A..= _type ]

instance T.FromJSON ChatSource where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatSourceMtprotoProxy" -> parseChatSourceMtprotoProxy v
   "chatSourcePublicServiceAnnouncement" -> parseChatSourcePublicServiceAnnouncement v
   _ -> mempty
  where
   parseChatSourceMtprotoProxy :: A.Value -> T.Parser ChatSource
   parseChatSourceMtprotoProxy = A.withObject "ChatSourceMtprotoProxy" $ \o -> do
    return $ ChatSourceMtprotoProxy {  }

   parseChatSourcePublicServiceAnnouncement :: A.Value -> T.Parser ChatSource
   parseChatSourcePublicServiceAnnouncement = A.withObject "ChatSourcePublicServiceAnnouncement" $ \o -> do
    text <- o A..:? "text"
    _type <- o A..:? "type"
    return $ ChatSourcePublicServiceAnnouncement { text = text, _type = _type }
 parseJSON _ = mempty
