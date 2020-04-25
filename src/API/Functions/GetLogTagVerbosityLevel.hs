-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLogTagVerbosityLevel where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetLogTagVerbosityLevel = 
 GetLogTagVerbosityLevel { tag :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON GetLogTagVerbosityLevel where
 toJSON (GetLogTagVerbosityLevel { tag = tag }) =
  A.object [ "@type" A..= T.String "getLogTagVerbosityLevel", "tag" A..= tag ]

instance T.FromJSON GetLogTagVerbosityLevel where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getLogTagVerbosityLevel" -> parseGetLogTagVerbosityLevel v
   _ -> mempty
  where
   parseGetLogTagVerbosityLevel :: A.Value -> T.Parser GetLogTagVerbosityLevel
   parseGetLogTagVerbosityLevel = A.withObject "GetLogTagVerbosityLevel" $ \o -> do
    tag <- o A..:? "tag"
    return $ GetLogTagVerbosityLevel { tag = tag }