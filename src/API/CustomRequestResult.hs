-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CustomRequestResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CustomRequestResult = 
 CustomRequestResult { result :: String }  -- deriving (Show)

instance T.ToJSON CustomRequestResult where
 toJSON (CustomRequestResult { result = result }) =
  A.object [ "@type" A..= T.String "customRequestResult", "result" A..= result ]
-- customRequestResult CustomRequestResult  { result :: String } 

