-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessageLinkInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetMessageLinkInfo = 
 GetMessageLinkInfo { url :: String }  -- deriving (Show)

instance T.ToJSON GetMessageLinkInfo where
 toJSON (GetMessageLinkInfo { url = url }) =
  A.object [ "@type" A..= T.String "getMessageLinkInfo", "url" A..= url ]
-- getMessageLinkInfo GetMessageLinkInfo  { url :: String } 

