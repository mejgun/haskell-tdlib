-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetBackgrounds where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetBackgrounds = 
 GetBackgrounds { for_dark_theme :: Bool }  -- deriving (Show)

instance T.ToJSON GetBackgrounds where
 toJSON (GetBackgrounds { for_dark_theme = for_dark_theme }) =
  A.object [ "@type" A..= T.String "getBackgrounds", "for_dark_theme" A..= for_dark_theme ]
-- getBackgrounds GetBackgrounds  { for_dark_theme :: Bool } 

