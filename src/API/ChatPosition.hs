-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatPosition where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.ChatSource as ChatSource
import {-# SOURCE #-} qualified API.ChatList as ChatList

-- |
-- 
-- Describes a position of a chat in a chat list
-- 
-- __list__ The chat list
-- 
-- __order__ A parameter used to determine order of the chat in the chat list. Chats must be sorted by the pair (order, chat.id) in descending order
-- 
-- __is_pinned__ True, if the chat is pinned in the chat list
-- 
-- __source__ Source of the chat in the chat list; may be null
data ChatPosition = 

 ChatPosition { source :: Maybe ChatSource.ChatSource, is_pinned :: Maybe Bool, order :: Maybe Int, list :: Maybe ChatList.ChatList }  deriving (Eq)

instance Show ChatPosition where
 show ChatPosition { source=source, is_pinned=is_pinned, order=order, list=list } =
  "ChatPosition" ++ U.cc [U.p "source" source, U.p "is_pinned" is_pinned, U.p "order" order, U.p "list" list ]

instance T.ToJSON ChatPosition where
 toJSON ChatPosition { source = source, is_pinned = is_pinned, order = order, list = list } =
  A.object [ "@type" A..= T.String "chatPosition", "source" A..= source, "is_pinned" A..= is_pinned, "order" A..= order, "list" A..= list ]

instance T.FromJSON ChatPosition where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatPosition" -> parseChatPosition v
   _ -> mempty
  where
   parseChatPosition :: A.Value -> T.Parser ChatPosition
   parseChatPosition = A.withObject "ChatPosition" $ \o -> do
    source <- o A..:? "source"
    is_pinned <- o A..:? "is_pinned"
    order <- mconcat [ o A..:? "order", readMaybe <$> (o A..: "order" :: T.Parser String)] :: T.Parser (Maybe Int)
    list <- o A..:? "list"
    return $ ChatPosition { source = source, is_pinned = is_pinned, order = order, list = list }
 parseJSON _ = mempty
