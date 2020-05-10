-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetDeepLinkInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns information about a tg:// deep link. Use "tg://need_update_for_some_feature" or "tg:some_unsupported_feature" for testing. Returns a 404 error for unknown links. Can be called before authorization 
-- 
-- __link__ The link
data GetDeepLinkInfo = 

 GetDeepLinkInfo { link :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON GetDeepLinkInfo where
 toJSON (GetDeepLinkInfo { link = link }) =
  A.object [ "@type" A..= T.String "getDeepLinkInfo", "link" A..= link ]

instance T.FromJSON GetDeepLinkInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getDeepLinkInfo" -> parseGetDeepLinkInfo v
   _ -> mempty
  where
   parseGetDeepLinkInfo :: A.Value -> T.Parser GetDeepLinkInfo
   parseGetDeepLinkInfo = A.withObject "GetDeepLinkInfo" $ \o -> do
    link <- o A..:? "link"
    return $ GetDeepLinkInfo { link = link }