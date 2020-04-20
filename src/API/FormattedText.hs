-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.FormattedText where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TextEntity as TextEntity

--main = putStrLn "ok"

data FormattedText = 
 FormattedText { entities :: [TextEntity.TextEntity], text :: String }  -- deriving (Show)

instance T.ToJSON FormattedText where
 toJSON (FormattedText { entities = entities, text = text }) =
  A.object [ "@type" A..= T.String "formattedText", "entities" A..= entities, "text" A..= text ]
-- formattedText FormattedText  { entities :: [TextEntity.TextEntity], text :: String } 

