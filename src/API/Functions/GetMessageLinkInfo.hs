-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessageLinkInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetMessageLinkInfo = 
 GetMessageLinkInfo { url :: String }  deriving (Show)

instance T.ToJSON GetMessageLinkInfo where
 toJSON (GetMessageLinkInfo { url = url }) =
  A.object [ "@type" A..= T.String "getMessageLinkInfo", "url" A..= url ]

instance T.FromJSON GetMessageLinkInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMessageLinkInfo" -> parseGetMessageLinkInfo v
   _ -> mempty
  where
   parseGetMessageLinkInfo :: A.Value -> T.Parser GetMessageLinkInfo
   parseGetMessageLinkInfo = A.withObject "GetMessageLinkInfo" $ \o -> do
    url <- o A..: "url"
    return $ GetMessageLinkInfo { url = url }