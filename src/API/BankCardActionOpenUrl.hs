-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BankCardActionOpenUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data BankCardActionOpenUrl = 
 BankCardActionOpenUrl { url :: String, text :: String }  -- deriving (Show)

instance T.ToJSON BankCardActionOpenUrl where
 toJSON (BankCardActionOpenUrl { url = url, text = text }) =
  A.object [ "@type" A..= T.String "bankCardActionOpenUrl", "url" A..= url, "text" A..= text ]
-- bankCardActionOpenUrl BankCardActionOpenUrl  { url :: String, text :: String } 

