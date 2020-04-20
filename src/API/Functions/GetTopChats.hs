-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetTopChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TopChatCategory as TopChatCategory

--main = putStrLn "ok"

data GetTopChats = 
 GetTopChats { limit :: Int, category :: TopChatCategory.TopChatCategory }  -- deriving (Show)

instance T.ToJSON GetTopChats where
 toJSON (GetTopChats { limit = limit, category = category }) =
  A.object [ "@type" A..= T.String "getTopChats", "limit" A..= limit, "category" A..= category ]
-- getTopChats GetTopChats  { limit :: Int, category :: TopChatCategory.TopChatCategory } 



instance T.FromJSON GetTopChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getTopChats" -> parseGetTopChats v
  where
   parseGetTopChats :: A.Value -> T.Parser GetTopChats
   parseGetTopChats = A.withObject "GetTopChats" $ \o -> do
    limit <- o A..: "limit"
    category <- o A..: "category"
    return $ GetTopChats { limit = limit, category = category }