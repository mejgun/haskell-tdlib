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

