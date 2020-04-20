-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveRecentHashtag where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data RemoveRecentHashtag = 
 RemoveRecentHashtag { hashtag :: String }  -- deriving (Show)

instance T.ToJSON RemoveRecentHashtag where
 toJSON (RemoveRecentHashtag { hashtag = hashtag }) =
  A.object [ "@type" A..= T.String "removeRecentHashtag", "hashtag" A..= hashtag ]
-- removeRecentHashtag RemoveRecentHashtag  { hashtag :: String } 

