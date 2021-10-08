-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Backgrounds where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Background as Background

-- |
-- 
-- Contains a list of backgrounds 
-- 
-- __backgrounds__ A list of backgrounds
data Backgrounds = 

 Backgrounds { backgrounds :: Maybe [Background.Background] }  deriving (Eq)

instance Show Backgrounds where
 show Backgrounds { backgrounds=backgrounds } =
  "Backgrounds" ++ cc [p "backgrounds" backgrounds ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Backgrounds where
 toJSON Backgrounds { backgrounds = backgrounds } =
  A.object [ "@type" A..= T.String "backgrounds", "backgrounds" A..= backgrounds ]

instance T.FromJSON Backgrounds where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "backgrounds" -> parseBackgrounds v
   _ -> mempty
  where
   parseBackgrounds :: A.Value -> T.Parser Backgrounds
   parseBackgrounds = A.withObject "Backgrounds" $ \o -> do
    backgrounds <- o A..:? "backgrounds"
    return $ Backgrounds { backgrounds = backgrounds }
 parseJSON _ = mempty
