-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EnableProxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data EnableProxy = 
 EnableProxy { proxy_id :: Int }  -- deriving (Show)

instance T.ToJSON EnableProxy where
 toJSON (EnableProxy { proxy_id = proxy_id }) =
  A.object [ "@type" A..= T.String "enableProxy", "proxy_id" A..= proxy_id ]
-- enableProxy EnableProxy  { proxy_id :: Int } 

