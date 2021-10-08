-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Animations where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Animation as Animation

-- |
-- 
-- Represents a list of animations 
-- 
-- __animations__ List of animations
data Animations = 

 Animations { animations :: Maybe [Animation.Animation] }  deriving (Eq)

instance Show Animations where
 show Animations { animations=animations } =
  "Animations" ++ cc [p "animations" animations ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Animations where
 toJSON Animations { animations = animations } =
  A.object [ "@type" A..= T.String "animations", "animations" A..= animations ]

instance T.FromJSON Animations where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "animations" -> parseAnimations v
   _ -> mempty
  where
   parseAnimations :: A.Value -> T.Parser Animations
   parseAnimations = A.withObject "Animations" $ \o -> do
    animations <- o A..:? "animations"
    return $ Animations { animations = animations }
 parseJSON _ = mempty
