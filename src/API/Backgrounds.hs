-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Backgrounds where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Background as Background

data Backgrounds = 
 Backgrounds { backgrounds :: [Background.Background] }  deriving (Show)

instance T.ToJSON Backgrounds where
 toJSON (Backgrounds { backgrounds = backgrounds }) =
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
    backgrounds <- o A..: "backgrounds"
    return $ Backgrounds { backgrounds = backgrounds }