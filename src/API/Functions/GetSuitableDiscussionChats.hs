-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSuitableDiscussionChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetSuitableDiscussionChats = 
 GetSuitableDiscussionChats -- deriving (Show)

instance T.ToJSON GetSuitableDiscussionChats where
 toJSON (GetSuitableDiscussionChats {  }) =
  A.object [ "@type" A..= T.String "getSuitableDiscussionChats" ]
-- getSuitableDiscussionChats GetSuitableDiscussionChats 

