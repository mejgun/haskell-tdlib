-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Minithumbnail where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Minithumbnail = 
 Minithumbnail { _data :: String, height :: Int, width :: Int }  -- deriving (Show)

instance T.ToJSON Minithumbnail where
 toJSON (Minithumbnail { _data = _data, height = height, width = width }) =
  A.object [ "@type" A..= T.String "minithumbnail", "data" A..= _data, "height" A..= height, "width" A..= width ]
-- minithumbnail Minithumbnail  { _data :: String, height :: Int, width :: Int } 

