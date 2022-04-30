-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetTopChats where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.TopChatCategory as TopChatCategory

-- |
-- 
-- Returns a list of frequently used chats. Supported only if the chat info database is enabled 
-- 
-- __category__ Category of chats to be returned
-- 
-- __limit__ The maximum number of chats to be returned; up to 30
data GetTopChats = 

 GetTopChats { limit :: Maybe Int, category :: Maybe TopChatCategory.TopChatCategory }  deriving (Eq)

instance Show GetTopChats where
 show GetTopChats { limit=limit, category=category } =
  "GetTopChats" ++ U.cc [U.p "limit" limit, U.p "category" category ]

instance T.ToJSON GetTopChats where
 toJSON GetTopChats { limit = limit, category = category } =
  A.object [ "@type" A..= T.String "getTopChats", "limit" A..= limit, "category" A..= category ]

instance T.FromJSON GetTopChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getTopChats" -> parseGetTopChats v
   _ -> mempty
  where
   parseGetTopChats :: A.Value -> T.Parser GetTopChats
   parseGetTopChats = A.withObject "GetTopChats" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    category <- o A..:? "category"
    return $ GetTopChats { limit = limit, category = category }
 parseJSON _ = mempty
