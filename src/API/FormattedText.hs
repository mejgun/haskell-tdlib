-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.FormattedText where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TextEntity as TextEntity

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
    entities <- optional $ o A..: "entities"
    text <- optional $ o A..: "text"
    return $ FormattedText { entities = entities, text = text }