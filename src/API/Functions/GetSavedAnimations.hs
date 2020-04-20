-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSavedAnimations where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetSavedAnimations = 
 GetSavedAnimations -- deriving (Show)

instance T.ToJSON GetSavedAnimations where
 toJSON (GetSavedAnimations {  }) =
  A.object [ "@type" A..= T.String "getSavedAnimations" ]
-- getSavedAnimations GetSavedAnimations 

