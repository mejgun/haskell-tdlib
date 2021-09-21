-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatFilterInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Contains basic information about a chat filter
-- 
-- __id__ Unique chat filter identifier
-- 
-- __title__ The title of the filter; 1-12 characters without line feeds
-- 
-- __icon_name__ The icon name for short filter representation. One of "All", "Unread", "Unmuted", "Bots", "Channels", "Groups", "Private", "Custom", "Setup", "Cat", "Crown", "Favorite", "Flower", "Game", "Home", "Love", "Mask", "Party", "Sport", "Study", "Trade", "Travel", "Work"
data ChatFilterInfo = 

 ChatFilterInfo { icon_name :: Maybe String, title :: Maybe String, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ChatFilterInfo where
 toJSON (ChatFilterInfo { icon_name = icon_name, title = title, _id = _id }) =
  A.object [ "@type" A..= T.String "chatFilterInfo", "icon_name" A..= icon_name, "title" A..= title, "id" A..= _id ]

instance T.FromJSON ChatFilterInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatFilterInfo" -> parseChatFilterInfo v
   _ -> mempty
  where
   parseChatFilterInfo :: A.Value -> T.Parser ChatFilterInfo
   parseChatFilterInfo = A.withObject "ChatFilterInfo" $ \o -> do
    icon_name <- o A..:? "icon_name"
    title <- o A..:? "title"
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatFilterInfo { icon_name = icon_name, title = title, _id = _id }