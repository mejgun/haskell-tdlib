-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLocalizationTargetInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns information about the current localization target. This is an offline request if only_local is true. Can be called before authorization 
-- 
-- __only_local__ Pass true to get only locally available information without sending network requests
data GetLocalizationTargetInfo = 

 GetLocalizationTargetInfo { only_local :: Maybe Bool }  deriving (Eq)

instance Show GetLocalizationTargetInfo where
 show GetLocalizationTargetInfo { only_local=only_local } =
  "GetLocalizationTargetInfo" ++ U.cc [U.p "only_local" only_local ]

instance T.ToJSON GetLocalizationTargetInfo where
 toJSON GetLocalizationTargetInfo { only_local = only_local } =
  A.object [ "@type" A..= T.String "getLocalizationTargetInfo", "only_local" A..= only_local ]

instance T.FromJSON GetLocalizationTargetInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getLocalizationTargetInfo" -> parseGetLocalizationTargetInfo v
   _ -> mempty
  where
   parseGetLocalizationTargetInfo :: A.Value -> T.Parser GetLocalizationTargetInfo
   parseGetLocalizationTargetInfo = A.withObject "GetLocalizationTargetInfo" $ \o -> do
    only_local <- o A..:? "only_local"
    return $ GetLocalizationTargetInfo { only_local = only_local }
 parseJSON _ = mempty
