-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetBackground where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.BackgroundType as BackgroundType
import {-# SOURCE #-} qualified API.InputBackground as InputBackground

-- |
-- 
-- Changes the background selected by the user; adds background to the list of installed backgrounds
-- 
-- __background__ The input background to use; pass null to create a new filled backgrounds or to remove the current background
-- 
-- __type__ Background type; pass null to use the default type of the remote background or to remove the current background
-- 
-- __for_dark_theme__ Pass true if the background is changed for a dark theme
data SetBackground = 

 SetBackground { for_dark_theme :: Maybe Bool, _type :: Maybe BackgroundType.BackgroundType, background :: Maybe InputBackground.InputBackground }  deriving (Eq)

instance Show SetBackground where
 show SetBackground { for_dark_theme=for_dark_theme, _type=_type, background=background } =
  "SetBackground" ++ cc [p "for_dark_theme" for_dark_theme, p "_type" _type, p "background" background ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetBackground where
 toJSON SetBackground { for_dark_theme = for_dark_theme, _type = _type, background = background } =
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
 parseJSON _ = mempty
