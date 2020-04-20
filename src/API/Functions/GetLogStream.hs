-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLogStream where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetLogStream = 
 GetLogStream -- deriving (Show)

instance T.ToJSON GetLogStream where
 toJSON (GetLogStream {  }) =
  A.object [ "@type" A..= T.String "getLogStream" ]
-- getLogStream GetLogStream 

