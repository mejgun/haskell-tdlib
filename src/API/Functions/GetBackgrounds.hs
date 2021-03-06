-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetBackgrounds where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns backgrounds installed by the user 
-- 
-- __for_dark_theme__ True, if the backgrounds needs to be ordered for dark theme
data GetBackgrounds = 

 GetBackgrounds { for_dark_theme :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON GetBackgrounds where
 toJSON (GetBackgrounds { for_dark_theme = for_dark_theme }) =
  A.object [ "@type" A..= T.String "getBackgrounds", "for_dark_theme" A..= for_dark_theme ]

instance T.FromJSON GetBackgrounds where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getBackgrounds" -> parseGetBackgrounds v
   _ -> mempty
  where
   parseGetBackgrounds :: A.Value -> T.Parser GetBackgrounds
   parseGetBackgrounds = A.withObject "GetBackgrounds" $ \o -> do
    for_dark_theme <- o A..:? "for_dark_theme"
    return $ GetBackgrounds { for_dark_theme = for_dark_theme }