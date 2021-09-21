-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetExternalLinkInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns information about an action to be done when the current user clicks an external link. Don't use this method for links from secret chats if web page preview is disabled in secret chats 
-- 
-- __link__ The link
data GetExternalLinkInfo = 

 GetExternalLinkInfo { link :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON GetExternalLinkInfo where
 toJSON (GetExternalLinkInfo { link = link }) =
  A.object [ "@type" A..= T.String "getExternalLinkInfo", "link" A..= link ]

instance T.FromJSON GetExternalLinkInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getExternalLinkInfo" -> parseGetExternalLinkInfo v
   _ -> mempty
  where
   parseGetExternalLinkInfo :: A.Value -> T.Parser GetExternalLinkInfo
   parseGetExternalLinkInfo = A.withObject "GetExternalLinkInfo" $ \o -> do
    link <- o A..:? "link"
    return $ GetExternalLinkInfo { link = link }