-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatPhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File

--main = putStrLn "ok"

data ChatPhoto = 
 ChatPhoto { big :: File.File, small :: File.File }  -- deriving (Show)

instance T.ToJSON ChatPhoto where
 toJSON (ChatPhoto { big = big, small = small }) =
  A.object [ "@type" A..= T.String "chatPhoto", "big" A..= big, "small" A..= small ]
-- chatPhoto ChatPhoto  { big :: File.File, small :: File.File } 

