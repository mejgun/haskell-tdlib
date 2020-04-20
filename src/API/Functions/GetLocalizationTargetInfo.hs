-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLocalizationTargetInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetLocalizationTargetInfo = 
 GetLocalizationTargetInfo { only_local :: Bool }  -- deriving (Show)

instance T.ToJSON GetLocalizationTargetInfo where
 toJSON (GetLocalizationTargetInfo { only_local = only_local }) =
  A.object [ "@type" A..= T.String "getLocalizationTargetInfo", "only_local" A..= only_local ]
-- getLocalizationTargetInfo GetLocalizationTargetInfo  { only_local :: Bool } 

