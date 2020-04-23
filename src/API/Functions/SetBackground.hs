-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetBackground where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BackgroundType as BackgroundType
import {-# SOURCE #-} qualified API.InputBackground as InputBackground

data SetBackground = 
 SetBackground { for_dark_theme :: Maybe Bool, _type :: Maybe BackgroundType.BackgroundType, background :: Maybe InputBackground.InputBackground }  deriving (Show)

instance T.ToJSON SetBackground where
 toJSON (SetBackground { for_dark_theme = for_dark_theme, _type = _type, background = background }) =
  A.object [ "@type" A..= T.String "setBackground", "for_dark_theme" A..= for_dark_theme, "type" A..= _type, "background" A..= background ]

instance T.FromJSON SetBackground where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setBackground" -> parseSetBackground v
   _ -> mempty
  where
   parseSetBackground :: A.Value -> T.Parser SetBackground
   parseSetBackground = A.withObject "SetBackground" $ \o -> do
    for_dark_theme <- optional $ o A..: "for_dark_theme"
    _type <- optional $ o A..: "type"
    background <- optional $ o A..: "background"
    return $ SetBackground { for_dark_theme = for_dark_theme, _type = _type, background = background }