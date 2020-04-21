-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSavedAnimations where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetSavedAnimations = 
 GetSavedAnimations deriving (Show)

instance T.ToJSON GetSavedAnimations where
 toJSON (GetSavedAnimations {  }) =
  A.object [ "@type" A..= T.String "getSavedAnimations" ]



instance T.FromJSON GetSavedAnimations where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getSavedAnimations" -> parseGetSavedAnimations v

   _ -> mempty ""
  where
   parseGetSavedAnimations :: A.Value -> T.Parser GetSavedAnimations
   parseGetSavedAnimations = A.withObject "GetSavedAnimations" $ \o -> do
    return $ GetSavedAnimations {  }