-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetProxies where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetProxies = 
 GetProxies -- deriving (Show)

instance T.ToJSON GetProxies where
 toJSON (GetProxies {  }) =
  A.object [ "@type" A..= T.String "getProxies" ]
-- getProxies GetProxies 

