-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatList where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ChatList = 
 ChatListMain 
 | ChatListArchive deriving (Show, Eq)

instance T.ToJSON ChatList where
 toJSON (ChatListMain {  }) =
  A.object [ "@type" A..= T.String "chatListMain" ]

 toJSON (ChatListArchive {  }) =
  A.object [ "@type" A..= T.String "chatListArchive" ]

instance T.FromJSON ChatList where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatListMain" -> parseChatListMain v
   "chatListArchive" -> parseChatListArchive v
   _ -> mempty
  where
   parseChatListMain :: A.Value -> T.Parser ChatList
   parseChatListMain = A.withObject "ChatListMain" $ \o -> do
    return $ ChatListMain {  }

   parseChatListArchive :: A.Value -> T.Parser ChatList
   parseChatListArchive = A.withObject "ChatListArchive" $ \o -> do
    return $ ChatListArchive {  }