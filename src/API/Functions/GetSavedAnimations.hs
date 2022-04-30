-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSavedAnimations where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns saved animations
data GetSavedAnimations = 

 GetSavedAnimations deriving (Eq)

instance Show GetSavedAnimations where
 show GetSavedAnimations {  } =
  "GetSavedAnimations" ++ U.cc [ ]

instance T.ToJSON GetSavedAnimations where
 toJSON GetSavedAnimations {  } =
  A.object [ "@type" A..= T.String "getSavedAnimations" ]

instance T.FromJSON GetSavedAnimations where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getSavedAnimations" -> parseGetSavedAnimations v
   _ -> mempty
  where
   parseGetSavedAnimations :: A.Value -> T.Parser GetSavedAnimations
   parseGetSavedAnimations = A.withObject "GetSavedAnimations" $ \o -> do
    return $ GetSavedAnimations {  }
 parseJSON _ = mempty
