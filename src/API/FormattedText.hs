-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.FormattedText where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TextEntity as TextEntity

-- |
-- 
-- A text with some entities 
-- 
-- __text__ The text
-- 
-- __entities__ Entities contained in the text. Entities can be nested, but must not mutually intersect with each other.
-- 
-- -Pre, Code and PreCode entities can't contain other entities. Bold, Italic, Underline and Strikethrough entities can contain and to be contained in all other entities. All other entities can't contain each other
data FormattedText = 

 FormattedText { entities :: Maybe [TextEntity.TextEntity], text :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON FormattedText where
 toJSON (FormattedText { entities = entities, text = text }) =
  A.object [ "@type" A..= T.String "formattedText", "entities" A..= entities, "text" A..= text ]

instance T.FromJSON FormattedText where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "formattedText" -> parseFormattedText v
   _ -> mempty
  where
   parseFormattedText :: A.Value -> T.Parser FormattedText
   parseFormattedText = A.withObject "FormattedText" $ \o -> do
    entities <- o A..:? "entities"
    text <- o A..:? "text"
    return $ FormattedText { entities = entities, text = text }