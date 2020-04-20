-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TMeUrls where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TMeUrl as TMeUrl

--main = putStrLn "ok"

data TMeUrls = 
 TMeUrls { urls :: [TMeUrl.TMeUrl] }  -- deriving (Show)

instance T.ToJSON TMeUrls where
 toJSON (TMeUrls { urls = urls }) =
  A.object [ "@type" A..= T.String "tMeUrls", "urls" A..= urls ]
-- tMeUrls TMeUrls  { urls :: [TMeUrl.TMeUrl] } 

