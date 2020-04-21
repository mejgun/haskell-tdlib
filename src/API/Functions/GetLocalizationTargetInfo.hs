-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLocalizationTargetInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetLocalizationTargetInfo = 
 GetLocalizationTargetInfo { only_local :: Bool }  deriving (Show)

instance T.ToJSON GetLocalizationTargetInfo where
 toJSON (GetLocalizationTargetInfo { only_local = only_local }) =
  A.object [ "@type" A..= T.String "getLocalizationTargetInfo", "only_local" A..= only_local ]



instance T.FromJSON GetLocalizationTargetInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getLocalizationTargetInfo" -> parseGetLocalizationTargetInfo v

   _ -> mempty ""
  where
   parseGetLocalizationTargetInfo :: A.Value -> T.Parser GetLocalizationTargetInfo
   parseGetLocalizationTargetInfo = A.withObject "GetLocalizationTargetInfo" $ \o -> do
    only_local <- o A..: "only_local"
    return $ GetLocalizationTargetInfo { only_local = only_local }