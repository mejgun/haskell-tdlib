-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatLists where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.ChatList as ChatList

-- |
-- 
-- Contains a list of chat lists 
-- 
-- __chat_lists__ List of chat lists
data ChatLists = 

 ChatLists { chat_lists :: Maybe [ChatList.ChatList] }  deriving (Eq)

instance Show ChatLists where
 show ChatLists { chat_lists=chat_lists } =
  "ChatLists" ++ U.cc [U.p "chat_lists" chat_lists ]

instance T.ToJSON ChatLists where
 toJSON ChatLists { chat_lists = chat_lists } =
  A.object [ "@type" A..= T.String "chatLists", "chat_lists" A..= chat_lists ]

instance T.FromJSON ChatLists where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatLists" -> parseChatLists v
   _ -> mempty
  where
   parseChatLists :: A.Value -> T.Parser ChatLists
   parseChatLists = A.withObject "ChatLists" $ \o -> do
    chat_lists <- o A..:? "chat_lists"
    return $ ChatLists { chat_lists = chat_lists }
 parseJSON _ = mempty
