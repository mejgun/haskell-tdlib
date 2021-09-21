-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetBackground where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BackgroundType as BackgroundType
import {-# SOURCE #-} qualified API.InputBackground as InputBackground

-- |
-- 
-- Changes the background selected by the user; adds background to the list of installed backgrounds
-- 
-- __background__ The input background to use. Pass null to create a new filled backgrounds. Pass null to remove the current background
-- 
-- __type__ Background type. Pass null to use default type of the remote background. Pass null to remove the current background
-- 
-- __for_dark_theme__ True, if the background is chosen for dark theme
data SetBackground = 

 SetBackground { for_dark_theme :: Maybe Bool, _type :: Maybe BackgroundType.BackgroundType, background :: Maybe InputBackground.InputBackground }  deriving (Show, Eq)

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
    for_dark_theme <- o A..:? "for_dark_theme"
    _type <- o A..:? "type"
    background <- o A..:? "background"
    return $ SetBackground { for_dark_theme = for_dark_theme, _type = _type, background = background }