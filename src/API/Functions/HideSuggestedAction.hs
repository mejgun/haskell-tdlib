-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.HideSuggestedAction where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SuggestedAction as SuggestedAction

-- |
-- 
-- Hides a suggested action 
-- 
-- __action__ Suggested action to hide
data HideSuggestedAction = 

 HideSuggestedAction { action :: Maybe SuggestedAction.SuggestedAction }  deriving (Show, Eq)

instance T.ToJSON HideSuggestedAction where
 toJSON (HideSuggestedAction { action = action }) =
  A.object [ "@type" A..= T.String "hideSuggestedAction", "action" A..= action ]

instance T.FromJSON HideSuggestedAction where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "hideSuggestedAction" -> parseHideSuggestedAction v
   _ -> mempty
  where
   parseHideSuggestedAction :: A.Value -> T.Parser HideSuggestedAction
   parseHideSuggestedAction = A.withObject "HideSuggestedAction" $ \o -> do
    action <- o A..:? "action"
    return $ HideSuggestedAction { action = action }