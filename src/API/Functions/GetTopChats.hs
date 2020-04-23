-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetTopChats where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TopChatCategory as TopChatCategory

data GetTopChats = 
 GetTopChats { limit :: Maybe Int, category :: Maybe TopChatCategory.TopChatCategory }  deriving (Show)

instance T.ToJSON GetTopChats where
 toJSON (GetTopChats { limit = limit, category = category }) =
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
    limit <- optional $ o A..: "limit"
    category <- optional $ o A..: "category"
    return $ GetTopChats { limit = limit, category = category }