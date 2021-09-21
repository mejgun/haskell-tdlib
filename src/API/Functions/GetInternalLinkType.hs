-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetInternalLinkType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns information about the type of an internal link. Returns a 404 error if the link is not internal. Can be called before authorization 
-- 
-- __link__ The link
data GetInternalLinkType = 

 GetInternalLinkType { link :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON GetInternalLinkType where
 toJSON (GetInternalLinkType { link = link }) =
  A.object [ "@type" A..= T.String "getInternalLinkType", "link" A..= link ]

instance T.FromJSON GetInternalLinkType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getInternalLinkType" -> parseGetInternalLinkType v
   _ -> mempty
  where
   parseGetInternalLinkType :: A.Value -> T.Parser GetInternalLinkType
   parseGetInternalLinkType = A.withObject "GetInternalLinkType" $ \o -> do
    link <- o A..:? "link"
    return $ GetInternalLinkType { link = link }