-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddSavedAnimation where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.InputFile as InputFile

-- |
-- 
-- Manually adds a new animation to the list of saved animations. The new animation is added to the beginning of the list. If the animation was already in the list, it is removed first. Only non-secret video animations with MIME type "video/mp4" can be added to the list
-- 
-- __animation__ The animation file to be added. Only animations known to the server (i.e., successfully sent via a message) can be added to the list
data AddSavedAnimation = 

 AddSavedAnimation { animation :: Maybe InputFile.InputFile }  deriving (Eq)

instance Show AddSavedAnimation where
 show AddSavedAnimation { animation=animation } =
  "AddSavedAnimation" ++ cc [p "animation" animation ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON AddSavedAnimation where
 toJSON AddSavedAnimation { animation = animation } =
  A.object [ "@type" A..= T.String "addSavedAnimation", "animation" A..= animation ]

instance T.FromJSON AddSavedAnimation where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addSavedAnimation" -> parseAddSavedAnimation v
   _ -> mempty
  where
   parseAddSavedAnimation :: A.Value -> T.Parser AddSavedAnimation
   parseAddSavedAnimation = A.withObject "AddSavedAnimation" $ \o -> do
    animation <- o A..:? "animation"
    return $ AddSavedAnimation { animation = animation }
 parseJSON _ = mempty
